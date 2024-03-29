Class {
	#name : #PolMinimalBaselineDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator-Baseline'
}

{ #category : #'baseline creation' }
PolMinimalBaselineDecorator >> baselineSourceFor: projectNameString [

	<todo: 'Should flexibilize the organization of packages. I am basing on Clean Code for Now'>

	^ 'baseline: spec
	<baseline>
        
	spec for: #''common'' do: [
		spec blessing: #''baseline''.
		self executeExtensionsConfigsFor: spec.
		
		spec baseline: ''Buoy'' with: [ spec repository: ''github://ba-st/Buoy:v6.1.0/source'' ];
		project: ''Buoy-Tests'' copyFrom: ''Buoy'' with: [ spec loads: #(''Dependent-SUnit-Extensions'') ];

		package: ''{1}-Core'';
		package: ''{1}-Adapter'' with: [ spec requires: #(''{1}-Core'') ];
		package: ''{1}-Config'' with: [ spec requires: #(''{1}-Adapter'') ];
		
		package: ''{1}-Tests'' with: [ spec requires: #(''{1}-Config'' ''Buoy-Tests'') ];
		
		package: ''{1}-Tools'';
		
		group: ''core'' with: #(''{1}-Config'');
		group: ''test'' with: #(core ''{1}-Tests'');
		group: ''dev'' with: #(test ''{1}-Tools'')
		
	].' format: { projectNameString }
]

{ #category : #'baseline creation' }
PolMinimalBaselineDecorator >> baselineSourceFullFor: projectNameString [

	<todo: 'estou separando as partes dessa baseline, deixei tudo aqui para ir pegando aos poucos.' >

	^ 'baseline: spec
	<baseline>
        
	spec for: #''common'' do: [
		spec blessing: #''baseline'';     
		
 	   baseline: ''Buoy'' with: [ spec repository: ''github://ba-st/Buoy:v6.1.0/source'' ];
		project: ''Buoy-Tests'' copyFrom: ''Buoy'' with: [ spec loads: #(''Dependent-SUnit-Extensions'') ];
		
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
		
		package: ''{1}-Tools'';
		
		group: ''core'' with: #(''{1}-Core'' ''{1}-Adapter'' ''{1}-Config'' ''ValidationNotification'');
		group: ''test'' with: #(core ''{1}-Tests'' ''{1}-AcceptanceCriteria'');
		group: ''dev'' with: #(test ''Seaside-Dev'' ''{1}-Tools'')
	].' format: { projectNameString }
]

{ #category : #configuration }
PolMinimalBaselineDecorator >> decorateWithMe [

	| baselineName baselineClass |
	
	project class compile: 'buildTool', String cr, '    ^ #Metacello'
	 			 	       classified: 'info'.
	
	baselineName := 'BaselineOf', (project projectName).
	baselineClass := (BaselineOf << baselineName asSymbol)
								 traits: { TPolExecExtensionsForBaselineOf };
		                 slots: {  };
		                 package: baselineName;
		                 install.

	baselineClass compile: (self baselineSourceFor: project projectName) classified: 'baseline'
]

{ #category : #configuration }
PolMinimalBaselineDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Add to the project a Basic configuration for Baseline configuration. #minimal'
]
