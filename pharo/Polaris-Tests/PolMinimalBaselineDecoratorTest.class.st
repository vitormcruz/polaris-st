Class {
	#name : #PolMinimalBaselineDecoratorTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#category : #'Polaris-Tests-Project-Decorator-Baseline'
}

{ #category : #tests }
PolMinimalBaselineDecoratorTest >> test_decorate_with_minimal_baseline [

	| mcWraperUtils |

	(PolNewProjectBuilder withProjectName: 'TestProject' andAcronym: '')
		cleanConfig;
		addDecorators: { PolMinimalBaselineDecorator };
		build.
		
	mcWraperUtils := MCBaselineWrapperUtilsTest newFor: 'BaselineOfTestProject'.
	mcWraperUtils hasExactlyThisElements: #('Buoy-Tests' 'Buoy' 'TestProject-Core' 'TestProject-Adapter' 'TestProject-Config' 
																'TestProject-Tests' 'TestProject-Tools' 'core' 'test' 'dev').
																
	mcWraperUtils group: 'core'
						 hasExactlyThisElements: #('TestProject-Config').
						
	mcWraperUtils group: 'test'
						 hasExactlyThisElements: #('core' 'TestProject-Tests').
						
	mcWraperUtils group: 'dev'
						 hasExactlyThisElements: #('test' 'TestProject-Tools').

	
	
]
