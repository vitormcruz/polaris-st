"
I define a protocol for Decorators of Projects.
"
Trait {
	#name : #TPolProjectDecorator,
	#instVars : [
		'project'
	],
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
TPolProjectDecorator classSide >> decorate: "PolProject" aProject [

	"Calls decoration with it's default configuration."
	
	^ self new project: aProject; decorate.
]

{ #category : #configuration }
TPolProjectDecorator >> createClassNamed: aClassName commentedWith: aComment withSufixForPackage: aPackageSufix [

	| createdClass |
	
	createdClass := (Object << aClassName asSymbol)
		                slots: {  };
		                package: project projectName , '-', aPackageSufix;
		                install.

	createdClass comment: aComment.
	^ createdClass
]

{ #category : #configuration }
TPolProjectDecorator >> createClassNamed: aClassName withTraits: aCollection commentedWith: aComment withSufixForPackage: aPackageSufix [

	| createdClass |
	
	createdClass := (Object << aClassName asSymbol)
								traits: aCollection;
		                slots: {  };
		                package: project projectName , '-', aPackageSufix;
		                install.

	createdClass comment: aComment.
	^ createdClass
]

{ #category : #configuration }
TPolProjectDecorator >> decorate [

	| dependenciesMissing |
	
	dependenciesMissing := self dependencies difference: project decorations.
	dependenciesMissing do: [ :decorator | decorator decorate: project ].
	self decorateWithMe.
	project wasDecoratedBy: self class.
]

{ #category : #configuration }
TPolProjectDecorator >> decorateWithMe [

	"Will be called during the project creation to apply the decoration 
	part of this class. The decoration process is a bigger part that 
	composes the execution of multiple configured decorations."
	
	self subclassResponsibility.
]

{ #category : #configuration }
TPolProjectDecorator >> dependencies [

	"Should return a list of dependents decorators. The default is no dependency, thus an empty list"
	
	^ {}.
]

{ #category : #configuration }
TPolProjectDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	self subclassResponsibility.
]

{ #category : #accessing }
TPolProjectDecorator >> project: "PolProject" aProject [

	aProject ifNil: [ self error: 'Cannot decorate a nil Project' ].
	project := aProject
]
