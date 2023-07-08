Class {
	#name : #'BaselineOfTPolTestProject_Dep3',
	#superclass : #PolBaselineOf,
	#category : #'BaselineOfTPolTestProject_Dep3'
}

{ #category : #baselines }
BaselineOfTPolTestProject_Dep3 >> baseline: spec [

	<baseline>
	
	super baseline: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
 			   group: 'baselineOnly' with: #().
		
	].
]
