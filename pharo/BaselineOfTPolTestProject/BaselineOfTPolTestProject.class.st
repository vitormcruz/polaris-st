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
		
		group: 'default' with: #('dev');
		group: 'core' with: #(Buoy);
		group: 'test' with: #(core);
		group: 'dev' with: #(test)
	].
]
