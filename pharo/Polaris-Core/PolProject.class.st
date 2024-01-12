"
I am a superclass for Projects created through `Polaris` and I store information of it that can be used later by aditional tools. 
My generated subclasses are not strictly necessary and can be removed if desired.
"
Class {
	#name : #PolProject,
	#superclass : #Object,
	#classInstVars : [
		'buildTool',
		'decorations'
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

{ #category : #accessing }
PolProject class >> decorations [

	^ decorations ifNil: [ decorations := Set new ] 
						 else: [ :it | it clone ] .
]

{ #category : #initialization }
PolProject class >> initialize [

	self class initializeSlots: self.
	super initialize.
	decorations := Set new.
]

{ #category : #info }
PolProject class >> projectName [

	self subclassResponsibility.
]

{ #category : #accessors }
PolProject class >> projectNamePrefixedAcronym [

	^ self acronym, self projectName.
]

{ #category : #decoration }
PolProject class >> wasDecoratedBy:  "TPolProjectDecorator" aClass [ 

	decorations add: aClass.
]

{ #category : #initialization }
PolProject >> initialize [

	self class initializeSlots: self.
	super initialize.
]
