"
I define a protocol to to Decorators of projects.
"
Trait {
	#name : #TPolProjectDecorator,
	#instVars : [
		'project'
	],
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
TPolProjectDecorator classSide >> decorate: aProject [

	^ self new project: aProject; decorate.
]

{ #category : #configuration }
TPolProjectDecorator >> decorate [

	"Will be called during the project creation to make it's decoration "
	
	self subclassResponsibility.
]

{ #category : #configuration }
TPolProjectDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	self subclassResponsibility.
]

{ #category : #accessing }
TPolProjectDecorator >> project: aProject [

	aProject ifNil: [ self error: 'Cannot decorate a nil Project' ].
	project := aProject
]
