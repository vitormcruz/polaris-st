Class {
	#name : #PolOneDummyDepDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #configuration }
PolOneDummyDepDecorator >> decorateWithMe [

	"Will be called during the project creation to make it's decoration "
	
	"Do nothing".
]

{ #category : #configuration }
PolOneDummyDepDecorator >> dependencies [

	"Should return a list of dependents decorators. The default is no dependency, thus an empty list"
	
	^ { PolNoDummyDepDecorator }.
]
