Class {
	#name : #PolNDummyDepDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #configuration }
PolNDummyDepDecorator >> decorate [

	"Will be called during the project creation to make it's decoration "
	
	"Do nothing".
]

{ #category : #configuration }
PolNDummyDepDecorator >> dependencies [

	"Should return a list of dependents decorators. The default is no dependency, thus and  empty list"
	
	^ { PolNoDummyDepDecorator. PolNoDummyDepDecorator. PolNoDummyDepDecorator2 }.
]
