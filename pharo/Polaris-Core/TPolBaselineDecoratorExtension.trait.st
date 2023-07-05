Trait {
	#name : #TPolBaselineDecoratorExtension,
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #decorating }
TPolBaselineDecoratorExtension >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line. The method itself must have a PolarisAddedMethod pragma."

	self  shouldBeImplemented.
]

{ #category : #decorating }
TPolBaselineDecoratorExtension >> decorateBaselineSource: aBaselineClass [

	| baselineMethod newMethodSource |
	
	baselineMethod := self class >> self baselineMethodTemplate.
	(baselineMethod  hasPragmaNamed: 'PolarisAddedMethod') ifFalse: [ self error: 'The baseline method template must be pragmed with <PolarisAddedMethod>' ].
	
	newMethodSource  := 'polDepFor_',   baselineMethod sourceCode.

	(RBAddMethodRefactoring 
		model: RBNamespace new 
		addMethod: newMethodSource 
		toClass: aBaselineClass 
		inProtocols:{'generated baseline'}) execute.
		
	(Metacello new  baseline: (aBaselineClass name copyReplaceAll: 'BaselineOf' with: '' ) ; silently) load.

]
