"
I wrap metacello baseline processing and provide usefull utilitary api for testing.
"
Class {
	#name : #MCBaselineWrapperUtilsTest,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#instVars : [
		'mcVersionSpec'
	],
	#category : #'Polaris-Tests-Project-Decorator-Baseline'
}

{ #category : #'instance creation' }
MCBaselineWrapperUtilsTest class >> newFor: aBaselineName [

	^self new baselineName: aBaselineName.
]

{ #category : #'instance creation' }
MCBaselineWrapperUtilsTest >> baselineName: aBaselineName [

	mcVersionSpec := (MetacelloBaselineConstructor on: aBaselineName asClass new) root
]

{ #category : #asserting }
MCBaselineWrapperUtilsTest >> group: aGroupName hasExactlyThisElements: aSetOfElements [

	self assertCollection: (mcVersionSpec packageNamed: aGroupName) includes 
		  hasSameElements: aSetOfElements asSet.
]

{ #category : #asserting }
MCBaselineWrapperUtilsTest >> hasExactlyThisElements: aSetOfElements [

	self assertCollection: (mcVersionSpec packages list collect: #name)
		  hasSameElements: aSetOfElements asSet.
]
