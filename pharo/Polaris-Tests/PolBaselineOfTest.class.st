Class {
	#name : #PolBaselineOfTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolBaselineOfTest >> test_execute_baseline_with_N_polaris_pragmed_method [

	| pragmedMethods |

	pragmedMethods  := OrderedCollection new.
	PolBaselineOfPolTest_N_MethodWithPragmas new baseline: pragmedMethods.

	self  assertCollection:  pragmedMethods  hasSameElements:  { #pragmedMethod: . #pragmedMethod2: . #pragmedMethod3: } .
]

{ #category : #tests }
PolBaselineOfTest >> test_execute_baseline_with_no_polaris_pragmed_method [

	| pragmedMethods |

	pragmedMethods  := OrderedCollection new.
	PolBaselineOfPolTest_NoMethodWithPragma new baseline: pragmedMethods.

	self  assert:  pragmedMethods isEmpty.
]

{ #category : #tests }
PolBaselineOfTest >> test_execute_baseline_with_one_polaris_pragmed_method [

	| pragmedMethods |

	pragmedMethods  := OrderedCollection new.
	PolBaselineOfPolTest_OneMethodWithPragma new baseline: pragmedMethods.

	self  assertCollection:  pragmedMethods  hasSameElements:  { #pragmedMethod: } .
]
