Class {
	#name : #ImprovedTestCommandLineHandler,
	#superclass : #TestCommandLineHandler,
	#category : #'Polaris-Core-Core'
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
ImprovedTestCommandLineHandler >> enableFileOutErrorTestService [

   [ CurrentExecutionEnvironment value enableService: FileOutErrorTestService ]
      on: MessageNotUnderstood
      do: [
         self traceCr:
            'I could not fileOutErrors because I am not executing inside a TestExecutionEnvironment' 
      ]
]

{ #category : #private }
ImprovedTestCommandLineHandler >> runPackages [

   (self hasOption: 'fileOutErrors') ifTrue: [ self enableFileOutErrorTestService ].
   super runPackages
]
