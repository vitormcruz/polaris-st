Class {
	#name : #PolProjectBuilderTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolProjectBuilderTest >> test_builder_after_minimal [

	| builder |
	
	builder := PolNewProjectBuilder withProjectName: 'TestProject' andAcronym: ''.
	
	builder becomeMinimal.
	
	self assertCollection: builder decorators
	     hasSameElements: { PolBaselineDecorator } 
	
]
