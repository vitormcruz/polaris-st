Trait {
	#name : #TPolBaselineDecoratorExtension,
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #decorating }
TPolBaselineDecoratorExtension classSide >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	self  shouldBeImplemented.
]

{ #category : #decorating }
TPolBaselineDecoratorExtension classSide >> decorateBaselineSource: aBaselineClass [

	| newMethodSource |
	
	newMethodSource  := 'polDepFor_', (self >> self baselineMethodTemplate  ) source.


	RBAddMethodRefactoring 
		model: RBNamespace new 
		addMethod: newMethodSource 
		toClass:Morph 
		inProtocols:{'generated baseline'}.

]
