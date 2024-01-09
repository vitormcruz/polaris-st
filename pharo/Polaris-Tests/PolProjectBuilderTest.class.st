Class {
	#name : #PolProjectBuilderTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolProjectBuilderTest >> test_minimal_config [

	| builder |
	
	builder := PolNewProjectBuilder withProjectName: 'TestProject' andAcronym: ''.
	
	builder becomeMinimal.
	
	self assertCollection: builder decorators
	     hasSameElements: { PolMinimalBaselineDecorator } 
	
]
