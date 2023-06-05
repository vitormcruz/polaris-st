Class {
	#name : #TPolProjectDecoratorTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Decorator'
}

{ #category : #tests }
TPolProjectDecoratorTest >> test_decorate_with_nil_project [


	self should:  [  PolDummyDecorator  decorate: nil  ]
		raise: Error
		 whoseDescriptionIncludes:  'Cannot decorate a nil Project'
		description:  'Should not be able to decorate a nil Project'.
]
