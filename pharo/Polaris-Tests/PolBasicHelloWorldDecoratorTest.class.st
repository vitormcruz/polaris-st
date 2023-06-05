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
	
	self expectedPackageCreated: 'PolTestHelloWorld-Core'.
	self expectedPackageCreated: 'PolTestHelloWorld-Test'.
	
	projectMock := Mock new.
	projectMock stub projectName willReturn: 'PolTestHelloWorld'.
	projectMock stub acronym willReturn: 'PolTst'.
	
	PolBasicHelloWorldDecorator decorate: projectMock.
	
	self assertClass: #PolTstHelloWorld asClass isAtPackage: 'PolTestHelloWorld-Core'.
	self assertClass: #PolTstHelloWorldTest asClass isAtPackage: 'PolTestHelloWorld-Tests'.

]
