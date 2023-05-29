Class {
	#name : #Polaris,
	#superclass : #Object,
	#category : #'Polaris-Core'
}

{ #category : #'project creation' }
Polaris class >> newProjectNamed: projectNameString [

	super new newProjectNamed: projectNameString.
]

{ #category : #'as yet unclassified' }
Polaris >> activateMethodSourceForProject: projectName [


	^ 'activate
	| adaptor |
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: ''', projectName , '''.

	Smalltalk snapshot: false andQuit: false'
]

{ #category : #'baseline creation' }
Polaris >> baselineSourceFor: projectNameString [

	^ 'baseline: spec
	<baseline>
        
	spec for: #''common'' do: [
		spec blessing: #''baseline'';     
		
 	   baseline: ''Buoy'' with: [ spec repository: ''github://ba-st/Buoy:v6.1.0/source'' ];
		project: ''Buoy-Tests'' copyFrom: ''Buoy'' with: [ spec loads: #(''Dependent-SUnit-Extensions'') ];
	   baseline: ''LangExtensions'' with: [ spec repository: ''gitlab://vitormcruz/sandbox-st:develop''; 
								 		 loads: #(core) ];
		
 	   baseline: ''Tome'' with: [ spec repository: ''github://vitormcruz/tome:develop/pharo''; loads: #(core) ];
 	   baseline: ''Grease'' with: [ spec repository: ''github://SeasideSt/Grease:v1.9.0/repository''; loads: #(default) ];
	
		baseline:''Seaside3'' with: [ spec repository: ''github://SeasideSt/Seaside:v3.4.7/repository'' ];
		project:''Seaside-Core'' copyFrom: ''Seaside3'' with: [ spec loads: #(''Core'' ''JSON'' ''Email'' ''Javascript'' ''JQuery'' ''JQueryUI'' ''Zinc'' ) ];
		project:''Seaside-Dev'' copyFrom: ''Seaside3'' with: [ spec loads: #(default) ];

		"MaterialDesignLite must be declared after Seaside3 so that the correct version of Grease (1.7.x) is taken, otherwise, version 1.5.0 is taken"
  	   baseline: ''MaterialDesignLite''	with: [ spec repository: ''github://DuneSt/MaterialDesignLite:v2.4.1/src''; loads: #(core) ];	
		baseline: ''ValidationNotification'' with: [ spec repository: ''github://vitormcruz/validation-sensor:master/pharo''; loads: #(core) ];

		package: ''{1}-Core'';
		package: ''{1}-Adapter'' with: [ spec requires: #(''Seaside-Core'' ''MaterialDesignLite'') ];
		package: ''{1}-Config'' with: [ spec requires: #(''{1}-Core'' ''{1}-Adapter'' ''Grease'') ];
		
		package: ''{1}-Tests'' with: [ spec requires: #(''{1}-Core'' ''Buoy-Tests'') ];
		package: ''{1}-AcceptanceCriteria'' with: [ spec requires: #(''{1}-Core'' ''Buoy-Tests'' ''Tome'' ''{1}-Tests'') ];
		
		group: ''default'' with: #(''dev'');
		group: ''core'' with: #(''{1}-Config'' ''ValidationNotification'');
		group: ''test'' with: #(core ''{1}-Tests'' ''{1}-AcceptanceCriteria'');
		group: ''dev'' with: #(test ''Seaside-Dev'')
	].' format: { projectNameString }
]

{ #category : #'baseline creation' }
Polaris >> createBaselineClassUsing: baselineName forProject: projectNameString [

	| baselineClass |
	
	baselineClass := (BaselineOf << baselineName asSymbol)
		                 slots: {  };
		                 package: baselineName;
		                 install.

	baselineClass compile: (self baselineSourceFor: projectNameString).

	(baselineClass compiledMethodAt: #baseline:) protocol: 'baseline'
]

{ #category : #'project creation' }
Polaris >> createBasicSeasideApplicationForProject: aProjectName [ 

	| sourceOfClass sourceOfClassAltered |

	sourceOfClass := String streamContents: [ :s | TemplateSeasideWebPage fileOutOn: s ].

	sourceOfClassAltered := sourceOfClass copyReplacingAll:  #('TemplateSeasideWebPage' 	'Polaris-Core-NewCode-Template-Seaside' '''<projectTitle>''') 
												    respectivelyBy: { aProjectName,'WebPage'. aProjectName, '-Adapter-Seaside'. aProjectName. }.

	CodeImporter evaluateFileStream: sourceOfClassAltered readStream.
]

{ #category : #'project creation' }
Polaris >> createEntity: anEntityName forProject: aProjectName [

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
Polaris >> createFeature: aFeatureTitle forProject: aProjectName [ 

	^ (TomeFeature  << aFeatureTitle asSymbol)
			slots: {  };
			package: aProjectName, '-AcceptanceCriteria';
			install.
]

{ #category : #'project creation' }
Polaris >> createMainClassForProject: projectName [

	| appClass appClassPackage |
	appClassPackage := projectName , '-Config'.

	appClass := (CommandLineHandler << (projectName , 'Main') asSymbol)
		            slots: {  };
		            package: appClassPackage;
		            install.


	appClass compile: (self activateMethodSourceForProject: projectName).

	(appClass compiledMethodAt: #activate) protocol: 'activate'
]

{ #category : #'instance creation' }
Polaris >> newProjectNamed: projectNameString [

	| baselineName |
	
	baselineName := 'BaselineOf' , projectNameString.
	
	self createBaselineClassUsing: baselineName forProject: projectNameString.
	self createEntity: 'HelloWorld' forProject: projectNameString.
	self createFeature: 'HelloWorldFeature' forProject: projectNameString.
	self createBasicSeasideApplicationForProject: projectNameString.
	self createMainClassForProject: projectNameString.
]
