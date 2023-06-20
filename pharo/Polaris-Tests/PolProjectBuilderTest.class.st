Class {
	#name : #PolProjectBuilderTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolProjectBuilderTest >> test_builder_after_minimal [

	| builder |
	
	builder := PolProjectBuilder withProjectName: 'TestProject' andAcronym: ''.
	
	builder becomeMinimal.
	
	self assertCollection: builder decorators
	     hasSameElements: { PolBaselineDecorator } 
	
]
