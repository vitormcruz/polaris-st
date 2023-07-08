"
I am used to represent a secopnd dependency for Baseline Extension tests
"
Class {
	#name : #'BaselineOfTPolTestProject_Dep2',
	#superclass : #PolBaselineOf,
	#category : #'BaselineOfTPolTestProject_Dep2'
}

{ #category : #baselines }
BaselineOfTPolTestProject_Dep2 >> baseline: spec [

	<baseline>
	
	super baseline: spec.
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		
		 spec baseline: 'TPolTestProject_Dep1' with: [ spec repository: 'github://vitormcruz/polaris-st:branchForTest/pharo' ].
		 spec group:  'core' with: #('TPolTestProject_Dep1' );
 			   group: 'baselineOnly' with: #().
	].
]
