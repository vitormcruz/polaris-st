Class {
	#name : #ImprovedTestCommandLineHandler,
	#superclass : #TestCommandLineHandler,
	#category : #'Polaris-Error-Handling-Support'
}

{ #category : #accessing }
ImprovedTestCommandLineHandler class >> description [
	^ 'A command line test runner. 
	Use --fileOutErrors to enable file out errors that happens during test execution. Use carefully as files may get big and the execution time will affected 
	as more and more errors get filed out.'
]

{ #category : #'handler selection' }
ImprovedTestCommandLineHandler class >> priority [
	^ 1
]

{ #category : #private }
ImprovedTestCommandLineHandler >> testRunner [

	| testRunner |
	
	testRunner := super testRunner.	
		
	self traceCr: 'Calling tesRunner altered'.
		
   (self hasOption: 'fileOutErrors') ifTrue: [ 
		self traceCr: 'FileOutError ON'.
		testRunner := HDTestReport addFileOutErrorAbilityTo: testRunner 
		
	].

	^ testRunner.
]
