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
		'subscriptions'
	],
	#category : #'Polaris-Tests-Project'
}

{ #category : #'test util' }
TPolNewProjectTestUtils >> assertClass:  aClass isAtPackage: aPackage [

	self assert: (aPackage definedClasses includes: aClass)
	        description: 'The expeted class ', aClass name,  ' was not created inside the package',  aPackage name.
]

{ #category : #'test util' }
TPolNewProjectTestUtils >> baselineClassNameForProject: projectName [

    "Return the corresponding a Baseline Name for the provided projectName if it exists or an empty
     string otherwise."

    ^ [ ('BaselineOf' , projectName) asClass name ] on: NotFound do: [ '' ]
]

{ #category : #'test util' }
TPolNewProjectTestUtils >> baselineMethodNameForProject: projectName [

	"Return 'baseline' if both the BaselineOf class and the baseline method exists for the provided projectName, 
	otherwise return an empty string."

    ^ [ (('BaselineOf' , projectName) asClass methodDict at: #baseline:) selector ] on: NotFound do: [ '' ]
]

{ #category : #running }
TPolNewProjectTestUtils >> handleMethodAdded: ann consideringPackageCreated: packagesCreated [

   (packagesCreated includes: ann methodPackage name) ifFalse: [
        methodsToClean add: ann method name ]
]

{ #category : #'test util' }
TPolNewProjectTestUtils >> packagesNamesForProject: projectName [

    "Return the corresponding packages coma separated names for the provided projectName if it exists or an empty
     string otherwise."

	^ ( RPackage organizer packageNames select: [ :name | name beginsWith: projectName, '-' ]) asSortedCollection 
			ifNotEmpty: [ :it | it reduce: [ :a :b | a, ', ', b ]  ]
			ifEmpty: [ '' ].
]

{ #category : #running }
TPolNewProjectTestUtils >> setUp [

   super setUp.
   epiceaMonitorStatusBeforeTests := EpMonitor current isEnabled.
   EpMonitor current disable.
   packagesCreatedToClean := OrderedCollection new.
   methodsToClean := OrderedCollection new.
   subscriptions := OrderedCollection new.
   subscriptions add: (SystemAnnouncer uniqueInstance when: ClassTagAdded
                                                      do: [ :classAddedAnn | packagesCreatedToClean add: classAddedAnn package name ]).

   subscriptions add: (SystemAnnouncer uniqueInstance when: MethodAdded 
                                                      do: [ :methodAddedAnn | self handleMethodAdded: methodAddedAnn 
	                                                                                consideringPackageCreated: packagesCreatedToClean ]).
]

{ #category : #running }
TPolNewProjectTestUtils >> tearDown [ 

	[
		super tearDown.
	   packagesCreatedToClean do: [ :packageName | RPackage organizer packageNamed: packageName ifPresent: #removeFromSystem ].
	   methodsToClean do: [ :method | (RBRemoveMethodChange remove: ((method substrings: '>>#') at: 2) asSymbol
		                                                    from: ((method substrings: '>>#') at: 1) asClass) execute ].
	] ensure: [ 
		EpMonitor current enabled: epiceaMonitorStatusBeforeTests. 
		subscriptions do: [ :subscription | SystemAnnouncer uniqueInstance removeSubscription: subscription ]
		
	]

]
