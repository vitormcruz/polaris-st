Class {
	#name : #'PolBaselineExample_With_N_MethodWithPragmas',
	#superclass : #BaselineOf,
	#traits : 'TPolExecExtensionsForBaselineOf',
	#classTraits : 'TPolExecExtensionsForBaselineOf classTrait',
	#category : #'Polaris-Tests-Project'
}

{ #category : #baselines }
PolBaselineExample_With_N_MethodWithPragmas >> baseline: "MetacelloBaselineCosntructor" spec [

	self executeExtensionsConfigsFor: spec
]

{ #category : #'test util' }
PolBaselineExample_With_N_MethodWithPragmas >> notPragmedMethod2: spec [


	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineExample_With_N_MethodWithPragmas >> notPragmedMethod: spec [

	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineExample_With_N_MethodWithPragmas >> pragmedMethod2: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]

{ #category : #'test util' }
PolBaselineExample_With_N_MethodWithPragmas >> pragmedMethod3: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]

{ #category : #'test util' }
PolBaselineExample_With_N_MethodWithPragmas >> pragmedMethod: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]
