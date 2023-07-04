Class {
	#name : #'PolBaselineOfPolTest_OneMethodWithPragma',
	#superclass : #PolBaselineOf,
	#category : #'Polaris-Tests-Project'
}

{ #category : #baselines }
PolBaselineOfPolTest_OneMethodWithPragma >> baseline: spec [

	super baseline: spec.
]

{ #category : #'test util' }
PolBaselineOfPolTest_OneMethodWithPragma >> notPragmedMethod2: spec [


	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineOfPolTest_OneMethodWithPragma >> notPragmedMethod: spec [

	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineOfPolTest_OneMethodWithPragma >> pragmedMethod: spec [

	<PolarisAddedMethod>
	
	spec add: thisContext compiledCode selector .

]
