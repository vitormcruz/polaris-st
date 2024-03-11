Class {
	#name : #PolNoDummyDepDecorator2,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #configuration }
PolNoDummyDepDecorator2 >> decorateWithMe [

	"Will be called during the project creation to make it's decoration "
	
	project addDummyChange: 'NoDummyDepChange'.
]
