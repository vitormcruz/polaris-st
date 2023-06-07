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

{ #category : #'project creation' }
PolProject class >> activateMethodSourceForProject: projectName [


	^ 'activate
	| adaptor |
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: ''', projectName , '''.

	Smalltalk snapshot: false andQuit: false'
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

{ #category : #'project creation' }
PolProject class >> createMainClassForProject: aProjectName [

	| appClass appClassPackage |
	appClassPackage := aProjectName , '-Config'.

	appClass := (CommandLineHandler << (aProjectName , 'Main') asSymbol)
		            slots: {  };
		            package: appClassPackage;
		            install.


	appClass 	compile: (self activateMethodSourceForProject: aProjectName)	classified: 'activate'
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

{ #category : #initialization }
PolProject >> initialize [

	self class initializeSlots: self.
	super initialize.
]
