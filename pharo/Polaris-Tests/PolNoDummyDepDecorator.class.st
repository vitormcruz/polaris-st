Class {
	#name : #PolNoDummyDepDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #configuration }
PolNoDummyDepDecorator >> decorate [

	"Will be called during the project creation to make it's decoration "
	
	project addDummyChange: 'NoDummyDepChange'.
]
