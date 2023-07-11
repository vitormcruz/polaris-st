Class {
	#name : #BaselineOfTPolTestProject,
	#superclass : #PolBaselineOf,
	#category : #BaselineOfTPolTestProject
}

{ #category : #baselines }
BaselineOfTPolTestProject >> baseline: "MetacelloBaselineCosntructor" [ spec

	<baseline>
	
	super baseline: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline';     
		
		 	   baseline: 'TPolTestProject_Dep1' with: [ spec repository: 'github://vitormcruz/polaris-st:main/pharo' ];
		           group:  'core' with: #('TPolTestProject_Dep1' ).
	].
]
