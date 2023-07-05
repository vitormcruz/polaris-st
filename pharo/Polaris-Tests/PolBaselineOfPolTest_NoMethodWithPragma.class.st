Class {
	#name : #'PolBaselineOfPolTest_NoMethodWithPragma',
	#superclass : #PolBaselineOf,
	#category : #'Polaris-Tests-Project'
}

{ #category : #baselines }
PolBaselineOfPolTest_NoMethodWithPragma >> baseline: spec [

	super baseline: spec.
]

{ #category : #'test util' }
PolBaselineOfPolTest_NoMethodWithPragma >> notPragmedMethod2: spec [

	spec add: thisContext compiledCode selector .
]

{ #category : #'test util' }
PolBaselineOfPolTest_NoMethodWithPragma >> notPragmedMethod: spec [ 

	spec add: thisContext compiledCode selector .
]
