Trait {
	#name : #TPolNewProjectUtils,
	#instVars : [
		'packagesCreatedToClean',
		'subscription'
	],
	#category : #'Polaris-Tests-Project'
}

{ #category : #'test util' }
TPolNewProjectUtils >> assertClass:  aClass isAtPackage: aPackage [

	self assert: (aPackage definedClasses includes: aClass)
	        description: 'The expeted class ', aClass name,  ' was not created inside the package',  aPackage name.
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
