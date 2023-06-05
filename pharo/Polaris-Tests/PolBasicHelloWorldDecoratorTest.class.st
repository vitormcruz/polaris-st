Class {
	#name : #PolBasicHelloWorldDecoratorTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#category : #'Polaris-Tests-Decorator'
}

{ #category : #'as yet unclassified' }
PolBasicHelloWorldDecoratorTest >> assertClass:  aClass isAtPackage: aPackageName [

	self assert: ((RPackage organizer packageNamed: aPackageName) definedClasses includes: aClass) 
	        description: 'The expeted class ', aClass name,  ' was not created inside the package',  aPackageName.
]

{ #category : #tests }
PolBasicHelloWorldDecoratorTest >> test_decorate_project_creates_correct_srtucture [

	| projectMock |
	
	self expectedPackageCreated: 'PolHelloWorld-Core'.
	self expectedPackageCreated: 'PolHelloWorldTest-Test'.
	
	projectMock := Mock new.
	projectMock  stub  willReturn: 'PolHelloWorld'.
	
	PolBasicHelloWorldDecorator decorate: projectMock.
	
	self assertClass: #PolHelloWorld asClass isAtPackage: 'PolHelloWorldTest-Test'.

]
