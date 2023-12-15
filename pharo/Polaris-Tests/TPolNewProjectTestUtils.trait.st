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
