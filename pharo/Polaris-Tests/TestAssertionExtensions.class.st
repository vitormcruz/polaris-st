"
TestAssertionExtensions
"
Class {
	#name : #TestAssertionExtensions,
	#superclass : #TestCase,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'Polaris-Tests'
}

{ #category : #tests }
TestAssertionExtensions >> testAssertBlockFalse [

   self should: [self assertBlock: [ 1 = 3 ]] 
		  raise: TestFailure   
		  withExceptionDo: [:exception | 
		  		self assert: exception messageText = 'Failed to evaluate "1 = 3"' 
					  description: 'Test failure message should be Failed to evaluate "1 = 3" but was "', exception messageText, '"'
		  ].
]

{ #category : #tests }
TestAssertionExtensions >> testAssertBlockTrue [

	self assertBlock: [ true ].
]
