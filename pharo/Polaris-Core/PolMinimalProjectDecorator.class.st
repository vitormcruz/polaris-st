Class {
	#name : #PolMinimalProjectDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolMinimalProjectDecorator >> decorate [

	| createdClass |
	
	createdClass := (Object << (project projectNamePrefixedAcronym, 'Entity') asSymbol)
								slots: {  };
								package: project projectName, '-Core';
								install.
								
	createdClass comment: 'I represent an Entity of the system. In a Clean Architecture, the Core package, where I am 
	installed, represents the Entity layer, or the Application Core in a Hexagonal Architecture. Classes like me, 
	installed on the Core package, should be independent of any underliyng service technology, such as Databases, 
	GUI or HTTP, 	and should have mostly general business rules.' 
	
	
	


	

	
	
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
