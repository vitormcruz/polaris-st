Class {
	#name : #BaselineOfTPolTestProject,
	#superclass : #BaselineOf,
	#category : #BaselineOfTPolTestProject
}

{ #category : #baselines }
BaselineOfTPolTestProject >> baseline: spec [

	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';     
		
 	   baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];

		package: 'PolTestProject-Core' with: [ spec requires: #('Buoy') ];
		package: 'PolTestProject-Adapter';
		package: 'PolTestProject-Config';
		package: 'PolTestProject-Tests';
		
		group: 'default' with: #('dev');
		group: 'core' with: #('PolTestProject-Core' 'PolTestProject-Adapter' 'PolTestProject-Config' 'ValidationNotification');
		group: 'test' with: #(core 'PolTestProject-Tests' 'PolTestProject-AcceptanceCriteria');
		group: 'dev' with: #(test 'Seaside-Dev')
	].
]
