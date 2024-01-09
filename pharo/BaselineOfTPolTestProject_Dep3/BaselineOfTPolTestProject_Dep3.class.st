Class {
	#name : #'BaselineOfTPolTestProject_Dep3',
	#superclass : #BaselineOf,
	#traits : 'TPolExecExtensionsForBaselineOf',
	#classTraits : 'TPolExecExtensionsForBaselineOf classTrait',
	#category : #'BaselineOfTPolTestProject_Dep3'
}

{ #category : #baselines }
BaselineOfTPolTestProject_Dep3 >> baseline: "MetacelloBaselineCosntructor" spec [

	<baseline>
	
	self executeExtensionsConfigsFor: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
 			   group: 'baselineOnly' with: #().
		
	].
]
