Class {
	#name : #PolBaselineDecoratorExtensionTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#category : #'Polaris-Tests-Project-Decorator-Baseline'
}

{ #category : #tests }
PolBaselineDecoratorExtensionTest >> test_add_dependency_that_causes_error [


	self should: [ PolConflictDepDecoratorExtensionForTest new decorateBaselineSource: BaselineOfTPolTestProject ] 
		  raise: MetacelloScriptNotification.

	
]

{ #category : #tests }
PolBaselineDecoratorExtensionTest >> test_decorate_baseline_correctly [

	| baselineSpecBuilt |
	
	PolOkMethodDecoratorExtensionForTest  new decorateBaselineSource: BaselineOfTPolTestProject.
	baselineSpecBuilt := (MetacelloBaselineConstructor on: BaselineOfTPolTestProject new) root.

	self assertCollection: (baselineSpecBuilt packages list collect: #name)
		  hasSameElements: #('TPolTestProject_Dep1' 'TPolTestProject_Dep3' 'core' 'baselineOnly').
		

]

{ #category : #tests }
PolBaselineDecoratorExtensionTest >> test_decorate_baseline_with_method_without_pragma [

	self should: [ PolNoPragmedMethodDecoratorExtensionForTest  new decorateBaselineSource: BaselineOfTPolTestProject ] 
		raise: Error 
		withMessageText: 'The baseline method template must be pragmed with <PolarisAddedMethod>'.

]
