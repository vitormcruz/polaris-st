Class {
	#name : #PolBaselineDecoratorExtensionTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project-Decorator-Baseline'
}

{ #category : #running }
PolBaselineDecoratorExtensionTest >> tearDown [

	 | methodsToRemove |

	 methodsToRemove := (BaselineOfTPolTestProject methods select: [ :method | method selector beginsWith: 'polDepFor_' ]) collect: #selector.

	(RBRemoveMethodRefactoring
 		model: RBNamespace new
		removeMethods: methodsToRemove
		from: BaselineOfTPolTestProject) execute.
]

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
