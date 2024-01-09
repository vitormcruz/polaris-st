"
I am used to represent a second dependency for Baseline Extension tests.
"
Class {
	#name : #'BaselineOfTPolTestProject_Dep1',
	#superclass : #BaselineOf,
	#traits : 'TPolExecExtensionsForBaselineOf',
	#classTraits : 'TPolExecExtensionsForBaselineOf classTrait',
	#category : #'BaselineOfTPolTestProject_Dep1'
}

{ #category : #baselines }
BaselineOfTPolTestProject_Dep1 >> baseline: "MetacelloBaselineCosntructor" spec [

	<baseline>
	
	self executeExtensionsConfigsFor: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
 			   group: 'baselineOnly' with: #().
			
	].
]
