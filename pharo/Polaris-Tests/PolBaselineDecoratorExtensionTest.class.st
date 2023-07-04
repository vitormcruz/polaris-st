Class {
	#name : #PolBaselineDecoratorExtensionTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project-Decorator'
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
PolBaselineDecoratorExtensionTest >> test_add_conflicting_dependency [

	self should: [ PolBuoy600DecoratorExtensionForTest new decorateBaselineSource: BaselineOfTPolTestProject ] 
		  raise: MetacelloPackageSpecResolutionError.

	
]

{ #category : #tests }
PolBaselineDecoratorExtensionTest >> test_decorate_baseline_with_method_without_pragma [

	self should: [ PolNoPragmedMethodDecoratorExtensionForTest  new decorateBaselineSource: BaselineOfTPolTestProject ] 
		raise: Error 
		withMessageText: 'The baseline method template must be pragmed with <PolarisAddedMethod>'.

]
