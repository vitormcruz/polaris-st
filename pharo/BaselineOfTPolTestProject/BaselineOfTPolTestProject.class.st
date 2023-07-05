Class {
	#name : #BaselineOfTPolTestProject,
	#superclass : #PolBaselineOf,
	#category : #BaselineOfTPolTestProject
}

{ #category : #baselines }
BaselineOfTPolTestProject >> baseline: spec [

	<baseline>
	
	super baseline: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline';     
		
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
		
		group: 'core' with: #(Buoy);
		group: 'test' with: #(core);
		group: 'dev' with: #(test)
	].
]

{ #category : #'generated baseline' }
BaselineOfTPolTestProject >> polDepFor_addBuoyDependencyTo: spec [

	<PolarisAddedMethod>

	 spec baseline: 'TPolTestProject_Dep1' with: [ spec repository: 'github://vitormcruz/polaris-st:main/pharo' ].
	 spec group:  'core' with: #('TPolTestProject_Dep1' ).
]
