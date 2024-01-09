Class {
	#name : #'PolBaselineExample_With_NoMethodWithPragma',
	#superclass : #BaselineOf,
	#traits : 'TPolExecExtensionsForBaselineOf',
	#classTraits : 'TPolExecExtensionsForBaselineOf classTrait',
	#category : #'Polaris-Tests-Project'
}

{ #category : #baselines }
PolBaselineExample_With_NoMethodWithPragma >> baseline: "MetacelloBaselineCosntructor" spec [

	self executeExtensionsConfigsFor: spec
]

{ #category : #'test util' }
PolBaselineExample_With_NoMethodWithPragma >> notPragmedMethod2: spec [

	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineExample_With_NoMethodWithPragma >> notPragmedMethod: spec [ 

	spec add: thisContext compiledCode selector .
]
