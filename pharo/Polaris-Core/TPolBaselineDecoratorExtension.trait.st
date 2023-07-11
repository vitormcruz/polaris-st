Trait {
	#name : #TPolBaselineDecoratorExtension,
	#category : #'Polaris-Core-Project-Decorator-Baseline'
}

{ #category : #decorating }
TPolBaselineDecoratorExtension >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line. The method itself must have a PolarisAddedMethod pragma."

	self  shouldBeImplemented.
]

{ #category : #decorating }
TPolBaselineDecoratorExtension >> decorateBaselineSource: "BaselineOf" [ aBaselineClass

   (RBAddMethodRefactoring
       model: RBNamespace new
       addMethod: self preapareMethodSourceForBaseline
       toClass: aBaselineClass
       inProtocols: { 'generated baseline' }) execute.

   self verifyBaseline: aBaselineClass
]

{ #category : #decorating }
TPolBaselineDecoratorExtension >> preapareMethodSourceForBaseline [

   | baselineMethod |

   baselineMethod := self class >> self baselineMethodTemplate.

   (baselineMethod hasPragmaNamed: 'PolarisAddedMethod') ifFalse: [ self error: 'The baseline method template must be pragmed with <PolarisAddedMethod>' ].

   ^ 'polDepFor_' , baselineMethod sourceCode
]

{ #category : #decorating }
TPolBaselineDecoratorExtension >> verifyBaseline: aBaselineClass [

   (Metacello new baseline: (aBaselineClass name copyReplaceAll: 'BaselineOf' with: ''); silently) record
]
