Class {
	#name : #PolDummyProject,
	#superclass : #PolProject,
	#classInstVars : [
		'decorationChanges'
	],
	#category : #'Polaris-Tests-Project'
}

{ #category : #info }
PolDummyProject class >> acronym [

	"The acronym for this project. May be blank "

	^ ''
]

{ #category : #adding }
PolDummyProject class >> addDummyChange: anObject [ 

	decorationChanges add: anObject.
]

{ #category : #info }
PolDummyProject class >> buildTool [
    ^ #Metacello
]

{ #category : #accessing }
PolDummyProject class >> clearDecorations [

	decorations removeAll.
	decorationChanges removeAll.
]

{ #category : #accessing }
PolDummyProject class >> decorationChanges [

	^ decorationChanges
]

{ #category : #initialization }
PolDummyProject class >> initialize [

	self class initializeSlots: self.
	super initialize.
	decorationChanges := OrderedCollection new.
]

{ #category : #info }
PolDummyProject class >> projectName [

	^ 'DummyProject'
]
