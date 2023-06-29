Class {
	#name : #PolBaselineDecoratorExtensionTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #tests }
PolBaselineDecoratorExtensionTest >> test_add_existing_dependency [


	self should: [ PolBaselineDecoratorExtensionDummy decorateBaselineSource: BaselineOfTPolTestProject ] 
		  raise: Error 
		  whoseDescriptionIncludes:  'The added configuration conflicts with the already define.'
		  description: 'Should have failed with The added configuration conflicts with the already define.'.

	
]
