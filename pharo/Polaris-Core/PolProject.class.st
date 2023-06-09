Class {
	#name : #PolProject,
	#superclass : #Object,
	#classInstVars : [
		'buildTool'
	],
	#category : #'Polaris-Core-Project'
}

{ #category : #info }
PolProject class >> acronym [

	"The acronym for this project. May be blank "

	self subclassResponsibility.
]

{ #category : #info }
PolProject class >> buildTool [

	"The build tool for this project, i.e. #Metacello"

	self subclassResponsibility.
]

{ #category : #'project creation' }
PolProject class >> createEntity: anEntityName forProject: aProjectName [

	(Object << anEntityName asSymbol)
			slots: {  };
		   package: aProjectName, '-Core';
		   install.
		
	(Object << (anEntityName, 'Test') asSymbol)
			slots: {  };
		   package: aProjectName, '-Tests';
		   install.
		
]

{ #category : #'project creation' }
PolProject class >> createFeature: aFeatureTitle forProject: aProjectName [ 

	^ (TomeFeature  << aFeatureTitle asSymbol)
			slots: {  };
			package: aProjectName, '-AcceptanceCriteria';
			install.
]

{ #category : #initialization }
PolProject class >> initialize [

	self class initializeSlots: self.
	super initialize.
]

{ #category : #info }
PolProject class >> projectName [

	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
PolProject class >> projectNamePrefixedAcronym [

	^ self acronym, self projectName.
]

{ #category : #initialization }
PolProject >> initialize [

	self class initializeSlots: self.
	super initialize.
]
