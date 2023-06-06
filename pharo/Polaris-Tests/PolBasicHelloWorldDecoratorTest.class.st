Class {
	#name : #PolBasicHelloWorldDecoratorTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#category : #'Polaris-Tests-Decorator'
}

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

{ #category : #tests }
PolBasicHelloWorldDecoratorTest >> test_decorate_project_creates_correct_srtucture_no_acronym [

	| projectMock |
	
	self expectedPackageCreated: 'PolTestHelloWorld-Core'.
	self expectedPackageCreated: 'PolTestHelloWorld-Test'.
	
	projectMock := Mock new.
	projectMock stub projectName willReturn: 'PolTestHelloWorld'.
	projectMock stub acronym willReturn: ''.
	
	PolBasicHelloWorldDecorator decorate: projectMock.
	
	self assertClass: #HelloWorld asClass isAtPackage: 'PolTestHelloWorld-Core'.
	self assertClass: #HelloWorldTest asClass isAtPackage: 'PolTestHelloWorld-Tests'.

]
