"
I am used to represent a secopnd dependency for Baseline Extension tests
"
Class {
	#name : #'BaselineOfTPolTestProject_Dep2',
	#superclass : #PolBaselineOf,
	#category : #BaselineOfTPolTestProject
}

{ #category : #baselines }
BaselineOfTPolTestProject_Dep2 >> baseline: spec [

	<baseline>
	
	super baseline: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		
	].
]
