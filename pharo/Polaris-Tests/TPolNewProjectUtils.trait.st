Trait {
	#name : #TPolNewProjectUtils,
	#instVars : [
		'packagesCreatedToClean',
		'subscription'
	],
	#category : #'Polaris-Tests'
}

{ #category : #'test util' }
TPolNewProjectUtils >> assertClass:  aClass isAtPackage: aPackageName [

	self assert: ((RPackage organizer packageNamed: aPackageName) definedClasses includes: aClass) 
	        description: 'The expeted class ', aClass name,  ' was not created inside the package',  aPackageName.
]

{ #category : #'test util' }
TPolNewProjectUtils >> expectedPackageCreated: aPackageName [

	packagesCreatedToClean add: aPackageName


]

{ #category : #running }
TPolNewProjectUtils >> setUp [
	super setUp.
	packagesCreatedToClean := OrderedCollection new.
	subscription := SystemAnnouncer uniqueInstance when: ClassTagAdded do: [ :ann | packagesCreatedToClean add: (ann package name) ].
]

{ #category : #running }
TPolNewProjectUtils >> tearDown [ 

	[
		super tearDown.
	   packagesCreatedToClean do: [ :packageName | RPackage organizer packageNamed: packageName ifPresent: #removeFromSystem ].
	] ensure: [ 
		SystemAnnouncer uniqueInstance removeSubscription: subscription. 
	]

]
