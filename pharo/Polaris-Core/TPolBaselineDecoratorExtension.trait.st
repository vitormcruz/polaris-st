"
I am a trait for Baseline Decorators, instead of creating new baselines, decorators of this kind must change the already created 
minimal `baseline:` method. I facilitates this by providing a hotspot method `baselineMethodTemplate` that must only return a 
selector poiting to a method configuration that extends the minimal baseline. 

Usage:

	Create a new Baseline Decoration Class Extension for wathever new configuration provided using me as trait:
```
Object << #ExtendsBaselineWithDepsToBouy
	traits: {TPolAddExtensionForBaselineOf};
	slots: {};
	package: 'MyBaselineExtensions'
```
	
and a `baselineMethodTemplate` realization poiting to the configuration method:

```
baselineMethodTemplate

	self #addBuoyTo:.
```

and the configuration method itself, note it must be :

```
addBuoyTo: spec

	spec baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
	spec group: 'core' with: #('Buoy');
	group
```

For every new baseline decoration, a validation is made.
"
Trait {
	#name : #TPolBaselineDecoratorExtension,
	#category : #'Polaris-Core-Project-Decorator-Baseline'
}

{ #category : #'hot spot' }
TPolBaselineDecoratorExtension >> baselineMethodTemplate [
	"Should return a selector refering to the method template that should be installed into the baseline. 
	The method itself must have a PolarisAddedMethod pragma."

	self  shouldBeImplemented.
]

{ #category : #decorating }
TPolBaselineDecoratorExtension >> decorateBaselineSource: "BaselineOf" aBaselineClass [

   (RBAddMethodRefactoring
       model: RBNamespace new
       addMethod: self preapareMethodSourceForBaseline
       toClass: aBaselineClass
       inProtocols: { 'generated_baseline' }) execute.

   self verifyBaseline: aBaselineClass
]

{ #category : #decorating }
TPolBaselineDecoratorExtension >> preapareMethodSourceForBaseline [

   | baselineMethod |

   baselineMethod := self class >> self baselineMethodTemplate.

	(baselineMethod hasPragmaNamed: 'PolarisAddedMethod') ifFalse: [ 
		self error: 'The baseline method template must be pragmed with <PolarisAddedMethod>' 
	].

   ^ 'polDepFor_' , baselineMethod sourceCode
]

{ #category : #decorating }
TPolBaselineDecoratorExtension >> verifyBaseline: aBaselineClass [

   (Metacello new baseline: (aBaselineClass name copyReplaceAll: 'BaselineOf' with: ''); silently) record
]
