Class {
	#name : #TPolExecExtensionsForBaselineOfTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
TPolExecExtensionsForBaselineOfTest >> test_execute_baseline_with_N_polaris_pragmed_method [

	| pragmedMethods |

	pragmedMethods  := OrderedCollection new. "pretending to be a spec"
	PolBaselineExample_With_N_MethodWithPragmas new baseline: pragmedMethods.

	self  assertCollection:  pragmedMethods  hasSameElements:  { #pragmedMethod: . #pragmedMethod2: . #pragmedMethod3: }.
]

{ #category : #tests }
TPolExecExtensionsForBaselineOfTest >> test_execute_baseline_with_no_polaris_pragmed_method [

	| pragmedMethods |

	pragmedMethods  := OrderedCollection new.
	PolBaselineExample_With_NoMethodWithPragma new baseline: pragmedMethods.

	self  assert:  pragmedMethods isEmpty.
]

{ #category : #tests }
TPolExecExtensionsForBaselineOfTest >> test_execute_baseline_with_one_polaris_pragmed_method [

	| pragmedMethods |

	pragmedMethods  := OrderedCollection new.
	PolBaselineExemple_With_OneMethodWithPragma new baseline: pragmedMethods.

	self  assertCollection:  pragmedMethods  hasSameElements:  { #pragmedMethod: } .
]
