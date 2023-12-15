Class {
	#name : #PolBasicHelloWorldDecoratorTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #tests }
PolBasicHelloWorldDecoratorTest >> test_decorate_project_creates_correct_srtucture [

	| projectMock |
	
	projectMock := Mock new.
	projectMock stub projectName willReturn: 'PolTestHelloWorld'.
	projectMock stub acronym willReturn: 'PolTst'.
	
	PolBasicHelloWorldDecorator decorate: projectMock.
	
	self assertClass: #PolTstHelloWorld asClass isAtPackage: 'PolTestHelloWorld-Core' asPackage.
	self assertClass: #PolTstHelloWorldTest asClass isAtPackage: 'PolTestHelloWorld-Tests' asPackage.

]

{ #category : #tests }
PolBasicHelloWorldDecoratorTest >> test_decorate_project_creates_correct_srtucture_no_acronym [

	<todo: 'Add more tests. Run the test class, run the hello class etc'>

	| projectMock |
	
	projectMock := Mock new.
	projectMock stub projectName willReturn: 'PolTestHelloWorld'.
	projectMock stub acronym willReturn: ''.
	
	PolBasicHelloWorldDecorator decorate: projectMock.
	
	self assertClass: #HelloWorld asClass isAtPackage: 'PolTestHelloWorld-Core' asPackage.
	self assertClass: #HelloWorldTest asClass isAtPackage: 'PolTestHelloWorld-Tests' asPackage.

]
