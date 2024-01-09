Class {
	#name : #BaselineOfTPolTestProject,
	#superclass : #BaselineOf,
	#traits : 'TPolExecExtensionsForBaselineOf',
	#classTraits : 'TPolExecExtensionsForBaselineOf classTrait',
	#category : #BaselineOfTPolTestProject
}

{ #category : #baselines }
BaselineOfTPolTestProject >> baseline: "MetacelloBaselineCosntructor" spec [

	<baseline>
	
	self executeExtensionsConfigsFor: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline';     
		
		 	   baseline: 'TPolTestProject_Dep1' with: [ spec repository: 'github://vitormcruz/polaris-st:main/pharo' ];
		      group: 'core' with: #('TPolTestProject_Dep1' );
 			   group: 'baselineOnly' with: #().
		
		
	].
]
