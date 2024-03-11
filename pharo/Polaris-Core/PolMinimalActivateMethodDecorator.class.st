Class {
	#name : #PolMinimalActivateMethodDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator-MethodActivate'
}

{ #category : #configuration }
PolMinimalActivateMethodDecorator >> decorateWithMe [

	(project projectName, 'Main') asClass
		compile: 'activate
	self executeActivateExtensions.
	^ ''Configure here the startup of your application'''
		classified: 'activation'
]

{ #category : #configuration }
PolMinimalActivateMethodDecorator >> dependencies [

	"Should return a list of dependents decorators. The default is no dependency, thus an empty list"
	
	^ {PolMinimalProjectDecorator}.
]

{ #category : #configuration }
PolMinimalActivateMethodDecorator >> description [ 
	
	'Minimal configuration for the Activation Method.'.
]
