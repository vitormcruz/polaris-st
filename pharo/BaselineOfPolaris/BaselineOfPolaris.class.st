Class {
	#name : #BaselineOfPolaris,
	#superclass : #BaselineOf,
	#category : #BaselineOfPolaris
}

{ #category : #baselines }
BaselineOfPolaris >> baseline: spec [

	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';     
		
 	   baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
          project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];
	   baseline: 'LangExtensions' with: [ spec repository: 'github://vitormcruz/sandbox-st:develop'; 
								 		 loads: #(core) ];
		
          baseline: 'Mocketry'  with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.2' ];

 	   baseline: 'Tome' with: [ spec repository: 'github://vitormcruz/tome:develop/pharo'; loads: #(core) ];

  	   baseline: 'MaterialDesignLite'	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.4.2/src'; loads: #(core) ];	
		baseline: 'ValidationNotification' with: [ spec repository: 'github://vitormcruz/validation-sensor:master/pharo'; loads: #(core) ];

		package: 'Polaris-Core' with: [ spec requires: #('LangExtensions' 'MaterialDesignLite' 'ValidationNotification') ];
		package: 'Polaris-Tests' with: [ spec requires: #('Polaris-Core' 'Buoy-Tests' 'Tome' 'Mocketry') ];
		package: 'Polaris-Tools-Inspector' with: [ spec requires: #('Polaris-Core') ];
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Polaris-Core' 'ValidationNotification');
		group: 'test' with: #(core 'Polaris-Tests');
		group: 'dev' with: #(test 'Polaris-Tools-Inspector')
	].
		
	
]
