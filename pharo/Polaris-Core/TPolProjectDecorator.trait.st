"
I define a protocol to to Decorators of projects.
"
Trait {
	#name : #TPolProjectDecorator,
	#instVars : [
		'project'
	],
	#category : #'Polaris-Core-Decorator'
}

{ #category : #configuration }
TPolProjectDecorator classSide >> decorate: aPolarisProject [

	^ self new project: aPolarisProject; decorate.
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
TPolProjectDecorator >> project: aPolarisProject [

	aPolarisProject ifNil: [ self error: 'Cannot decorate a nil Project' ].
	project := aPolarisProject
]
