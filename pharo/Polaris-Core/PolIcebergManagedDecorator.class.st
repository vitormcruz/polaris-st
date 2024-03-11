Class {
	#name : #PolIcebergManagedDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolIcebergManagedDecorator >> decorateWithMe [

	"Will be called during the project creation to apply the decoration 
	part of this class. The decoration process is a bigger part that 
	composes the execution of multiple configured decorations."
	
	(IceRepositoryCreator new
				location: (IceLibgitRepository repositoriesLocation / self repoNameForProject) asFileReference ;
				createNewRepositoryNamed: self repoNameForProject) register.
]

{ #category : #'as yet unclassified' }
PolIcebergManagedDecorator >> repoNameForProject [

	| repoName |
	repoName := String streamContents: [ :stream |
		project projectName do: [ :c | 
			c isUppercase ifTrue: [ stream nextPut: $- ].
			stream nextPut: c lowercase
		]
	].

	(repoName first = $-) 
		ifTrue: [ repoName := repoName allButFirst ].
		
	^ repoName, '-st'.
]
