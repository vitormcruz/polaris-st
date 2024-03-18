"
I provide utilities for tests that create new projects as well as general preparation and clean up. 
For example, I automatically delete created classes and packages trought the test and avoid epicea 
code change logging.
"
Trait {
	#name : #TPolNewProjectTestUtils,
	#instVars : [
		'packagesCreatedToClean',
		'epiceaMonitorStatusBeforeTests',
		'methodsToClean',
		'subscriptions',
		'packageContextLinkToAnn'
	],
	#category : #'Polaris-Tests-Project'
}

{ #category : #instrumentation }
TPolNewProjectTestUtils >> addPkgContextToAnn: object [

	| packageCallContext currentSender |

	currentSender := self reachAnnoucementContextPoint: thisContext sender.
	packageCallContext := Set new.		
	[ currentSender isNotNil ] whileTrue: [
		packageCallContext add: currentSender contextClass package name.
		currentSender := currentSender sender.
	].

	^ object propertyAt: #packageCallContext put: packageCallContext
]

{ #category : #'pck context validation' }
TPolNewProjectTestUtils >> annHasPolarisPkgContext: classAddedAnn [

	classAddedAnn properties 
		at: #packageCallContext 
		ifPresent: [	:packageCallContext | ^ packageCallContext anySatisfy: [ :pck | pck beginsWith: 'Polaris-' ] ] 
		ifAbsent: [ ^ false ].

]

{ #category : #'test util' }
TPolNewProjectTestUtils >> assertClass:  aClass isAtPackage: aPackage [

	self assert: (aPackage definedClasses includes: aClass)
	     description: 'The expeted class ', aClass name,  ' was not created inside the package',  aPackage name.
]

{ #category : #'test util' }
TPolNewProjectTestUtils >> baselineMethodNameForProject: projectName [

	"Return 'baseline' if both the BaselineOf class and the baseline method exists for the provided projectName, 
	otherwise return an empty string."

    ^ [ (('BaselineOf' , projectName) asClass methodDict at: #baseline:) selector ] on: NotFound do: [ '' ]
]

{ #category : #'test util' }
TPolNewProjectTestUtils >> classNameIfExists: className [

    "Return the corresponding class name if it exists or an empty string otherwise."

    ^ [ className asClass name ] on: NotFound do: [ '' ]
]

{ #category : #running }
TPolNewProjectTestUtils >> cleanZombiePolarisSubscriptions [

	| zombiePolarisSubscriptions |
	zombiePolarisSubscriptions := SystemAnnouncer uniqueInstance subscriptions subscriptions select: [ :subs |
		                              subs subscriber class package name asString beginsWith: 'Polaris-' 
												].
											
	zombiePolarisSubscriptions do: [ :zombieSubscription | SystemAnnouncer uniqueInstance removeSubscription: zombieSubscription ]
]

{ #category : #instrumentation }
TPolNewProjectTestUtils >> createInstrumentationLink [

	^ MetaLink new
		  metaObject: [ :announcement | self addPkgContextToAnn: announcement ];
		  arguments: #( #object );
		  control: #before;
		  selector: #value:
]

{ #category : #'handle announcements' }
TPolNewProjectTestUtils >> handleMethodAdded: ann consideringPackageCreated: packagesCreated [

	self traceCr: 'AnnMethodAdded: ', ann method name asString.
	(self annHasPolarisPkgContext: ann ) ifTrue: [
		self traceCr: (ann properties at: #packageCallContext ) asString.
	   (packagesCreated includes: ann methodPackage name) ifFalse: [
	   	methodsToClean add: ann method name.
		]
	]
]

{ #category : #instrumentation }
TPolNewProjectTestUtils >> instrumentAnnouncements: aListOfAnnMethods [

	packageContextLinkToAnn := packageContextLinkToAnn ifNil: [ self createInstrumentationLink ].
	aListOfAnnMethods do: [ :annMethod | annMethod ast link: packageContextLinkToAnn ].
]

{ #category : #'test util' }
TPolNewProjectTestUtils >> packagesNamesForProject: projectName [

    "Return the corresponding packages coma separated names for the provided projectName if it exists or an empty
     string otherwise."

	^ ( RPackage organizer packageNames select: [ :name | name beginsWith: projectName, '-' ]) asSortedCollection 
			ifNotEmpty: [ :it | it reduce: [ :a :b | a, ', ', b ]  ]
			ifEmpty: [ '' ].
]

{ #category : #'handle announcements' }
TPolNewProjectTestUtils >> processClassTagAdded: classAddedAnn [

	(self annHasPolarisPkgContext: classAddedAnn) ifTrue: [
		packagesCreatedToClean add: classAddedAnn package name.
	]
]

{ #category : #instrumentation }
TPolNewProjectTestUtils >> reachAnnoucementContextPoint: context [

	| currentContext | 
	
	currentContext := context.
	[ currentContext isNotNil & (currentContext contextClass package name ~= 'System-Announcements') ] 
		whileTrue: [ currentContext := currentContext sender ].
		
	^ currentContext.
]

{ #category : #instrumentation }
TPolNewProjectTestUtils >> removeInstrumentationToAnnouncements [

	packageContextLinkToAnn uninstall.
]

{ #category : #running }
TPolNewProjectTestUtils >> setUp [

	super setUp.
	
	self cleanZombiePolarisSubscriptions.
	epiceaMonitorStatusBeforeTests := EpMonitor current isEnabled.
	EpMonitor current disable.
	packagesCreatedToClean := OrderedCollection new.
	methodsToClean := OrderedCollection new.
	subscriptions := OrderedCollection new.
	self instrumentAnnouncements: {	(ClassTagAnnouncement >> #package:).	(MethodAnnouncement >> #method:) }.

	subscriptions add: (SystemAnnouncer uniqueInstance
									when: ClassTagAdded
			 						do: [ :classAddedAnn | self processClassTagAdded: classAddedAnn ]).

	subscriptions add: (SystemAnnouncer uniqueInstance 
									when: MethodAdded 
									do: [ :methodAddedAnn | self handleMethodAdded: methodAddedAnn consideringPackageCreated: packagesCreatedToClean ])
]

{ #category : #running }
TPolNewProjectTestUtils >> tearDown [ 

	[
		super tearDown.
	   packagesCreatedToClean do: [ :packageName | RPackage organizer packageNamed: packageName ifPresent: #removeFromSystem ].
	   methodsToClean do: [ :method | (RBRemoveMethodChange remove: ((method substrings: '>>#') at: 2) asSymbol
		                                                    from: ((method substrings: '>>#') at: 1) asClass) execute ].
	] ensure: [ 
		self removeInstrumentationToAnnouncements.
		EpMonitor current enabled: epiceaMonitorStatusBeforeTests. 
		subscriptions do: [ :subscription | SystemAnnouncer uniqueInstance removeSubscription: subscription ]
		
	]

]
