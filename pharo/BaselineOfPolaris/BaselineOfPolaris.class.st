Class {
	#name : #BaselineOfPolaris,
	#superclass : #BaselineOf,
	#category : #BaselineOfPolaris
}

{ #category : #baselines }
BaselineOfPolaris >> baseline: "MetacelloBaselineCosntructor" spec [

	<baseline>
        
    spec for: #'common' do: [
        spec blessing: #'baseline';     

             baseline: 'Avatar' with: [ spec repository: 'github://vitormcruz/avatar:createBaseline'; loads: #(core) ];	
					baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
                 project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];

             baseline: 'LangExtensions' with: [ spec repository: 'github://vitormcruz/sandbox-st:develop'; 
                                                loads: #(core) ];
		
             baseline: 'Mocketry'  with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.2' ];
             baseline: 'Tome' with: [ spec repository: 'github://vitormcruz/tome:develop/pharo'; loads: #(core) ];
             baseline: 'MaterialDesignLite'	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.4.2/src'; loads: #(core) ];	
             baseline: 'ValidationSensor' with: [ spec repository: 'github://vitormcruz/validation-sensor:master/pharo'; loads: #(core) ];
             package: 'Polaris-Core' with: [ spec requires: #('LangExtensions' 'MaterialDesignLite' 'ValidationSensor') ];
             package: 'BaselineOfTPolTestProject'; 
             package: 'BaselineOfTPolTestProject_Dep1';
             package: 'BaselineOfTPolTestProject_Dep2'; 
             package: 'BaselineOfTPolTestProject_Dep3'; 
             package: 'Polaris-Tests' with: [ spec requires: #('Polaris-Core' 'BaselineOfTPolTestProject' 'BaselineOfTPolTestProject_Dep1' 
                                                               'BaselineOfTPolTestProject_Dep2' 'BaselineOfTPolTestProject_Dep3' 'Buoy-Tests' 
                                                               'Tome' 'Mocketry') ];
             package: 'Polaris-Core' with: [ spec requires: #(Avatar) ];
             package: 'Polaris-Tools-Inspector' with: [ spec requires: #('Polaris-Core') ].

        spec group: 'core' with: #('Polaris-Core' 'ValidationSensor' );
             group: 'test' with: #(core 'Polaris-Tests');
             group: 'dev' with: #(test 'Polaris-Tools-Inspector').	
	 ]
]
