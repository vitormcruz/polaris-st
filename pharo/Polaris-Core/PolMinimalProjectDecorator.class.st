Class {
	#name : #PolMinimalProjectDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolMinimalProjectDecorator >> decorate [

	self	createClassNamed: 'Entity'
			commentedWith: 'I represent an Entity of the system. In a Clean Architecture, the Core package, where I am 
				installed, represents the Entity layer, or the Application Core in a Hexagonal Architecture. Classes like me, 
				installed on the Core package, should be independent of any underliyng service technology, such as Databases, 
				GUI or HTTP, 	and should have mostly general business rules.'
			withSufixForPackage: 'Core'.

	self	createClassNamed: 'EntityTest'
			commentedWith: 'Classes, especially core one, should have automated tests, I am the corresponding unit 
				class test for the Entity class. The most simple implementation of tests on Smalltalk uses SUnit, in which each 
				test class is a sublass of TestCase.'
			withSufixForPackage: 'Tests'.
			
	self	createClassNamed: 'EntityGateway'
			commentedWith: 'I am an example of an adapter to an Entity of the system, specifically, a Gateway for 
				database representation of the Entity. The adapter is a layer described in the Clean and Hexagonal Architecture'
			withSufixForPackage: 'Adapter'.

	self	createClassNamed: 'Main'
			commentedWith: 'The config layer basically contains glue code theframeworks used by the application and it''s basic 
				configuration. This layer is described as "Frameworks and Drivers" by the Clean Architecture.'
			withSufixForPackage: 'Config'.
			
	self	createClassNamed: 'SomeTool'
			commentedWith: 'This is a separated layer used to define tools that can be implemented to be used during development
				 of the application'
			withSufixForPackage: 'Tools'.
]

{ #category : #configuration }
PolMinimalProjectDecorator >> dependencies [

	"Should return a list of dependents decorators. The default is no dependency, thus and  empty list"
	
	^ {PolMinimalBaselineDecorator}.
]

{ #category : #configuration }
PolMinimalProjectDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Create a Main class with the configuration to activate the application, enabling it to be used through CommandLine. Can be extended'
]
