Class {
	#name : #'PolBaselineOfPolTest_N_MethodWithPragmas',
	#superclass : #PolBaselineOf,
	#category : #'Polaris-Tests-Project'
}

{ #category : #baselines }
PolBaselineOfPolTest_N_MethodWithPragmas >> baseline: spec [

	super baseline: spec.
]

{ #category : #'test util' }
PolBaselineOfPolTest_N_MethodWithPragmas >> notPragmedMethod2: spec [


	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineOfPolTest_N_MethodWithPragmas >> notPragmedMethod: spec [

	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineOfPolTest_N_MethodWithPragmas >> pragmedMethod2: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]

{ #category : #'test util' }
PolBaselineOfPolTest_N_MethodWithPragmas >> pragmedMethod3: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]

{ #category : #'test util' }
PolBaselineOfPolTest_N_MethodWithPragmas >> pragmedMethod: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]
