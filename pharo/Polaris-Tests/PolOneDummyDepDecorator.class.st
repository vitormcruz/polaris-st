Class {
	#name : #PolOneDummyDepDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #configuration }
PolOneDummyDepDecorator >> decorate [

	"Will be called during the project creation to make it's decoration "
	
	"Do nothing".
]

{ #category : #configuration }
PolOneDummyDepDecorator >> dependencies [

	"Should return a list of dependents decorators. The default is no dependency, thus and  empty list"
	
	^ { PolNoDummyDepDecorator }.
]
