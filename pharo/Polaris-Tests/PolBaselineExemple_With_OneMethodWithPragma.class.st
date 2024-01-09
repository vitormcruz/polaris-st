Class {
	#name : #'PolBaselineExemple_With_OneMethodWithPragma',
	#superclass : #Object,
	#traits : 'TPolExecExtensionsForBaselineOf',
	#classTraits : 'TPolExecExtensionsForBaselineOf classTrait',
	#category : #'Polaris-Tests-Project'
}

{ #category : #baselines }
PolBaselineExemple_With_OneMethodWithPragma >> baseline: "MetacelloBaselineCosntructor" spec [

	self executeExtensionsConfigsFor: spec
]

{ #category : #'test util' }
PolBaselineExemple_With_OneMethodWithPragma >> notPragmedMethod2: spec [


	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineExemple_With_OneMethodWithPragma >> notPragmedMethod: spec [

	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineExemple_With_OneMethodWithPragma >> pragmedMethod: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]
