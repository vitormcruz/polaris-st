Class {
	#name : #PolCommandLineMainClassDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolCommandLineMainClassDecorator >> decorate [

	(project projectName, 'Main') asClass subclass: #CommandLineHandler.
]

{ #category : #configuration }
PolCommandLineMainClassDecorator >> dependencies [

	"Should return a list of dependents decorators. The default is no dependency, thus an empty list"
	
	^ { PolMinimalActivateMethodDecorator }.
]

{ #category : #configuration }
PolCommandLineMainClassDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Create a Main class with the configuration to activate the application, enabling it to be used through CommandLine. Can be extended'
]
