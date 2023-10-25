Class {
	#name : #FileOutErrorsProxyHandler,
	#superclass : #Object,
	#category : #'Polaris-Error-Handling-Support'
}

{ #category : #'file error creation' }
FileOutErrorsProxyHandler >> buildUniqueErrorFileName [

   ^ (((DateAndTime now asString substrings: '.') at: 1)
         replaceAll: $:
         with: $-) , '.fuel'
]

{ #category : #private }
FileOutErrorsProxyHandler >> enableFileOutErrorTestService [

   [ CurrentExecutionEnvironment value enableService: FileOutErrorTestService ]
      on: MessageNotUnderstood
      do: [
         self traceCr:
            'I could not fileOutErrors because I am not executing inside a TestExecutionEnvironment' 
      ]
]

{ #category : #'file error creation' }
FileOutErrorsProxyHandler >> generateFileFrom: anException [

   | errorFilePath errorFileName |

   errorFilePath := FileSystem disk workingDirectory / 'fueled_out_errors'.
   errorFilePath ensureCreateDirectory.
   errorFileName := (errorFilePath / self buildUniqueErrorFileName) fullName.

	self traceCr: 'Creating fueled out error on: ', errorFileName.

   anException signalerContext serializeToFileNamed: errorFileName
]

{ #category : #handling }
FileOutErrorsProxyHandler >> handleMessage: aMessage toTarget: anObject [

	self traceCr: 'Proxy Handling to: ', aMessage selector asString, 'to Object', anObject asString.

	(aMessage selector == #unhandledErrorDefaultAction:) ifTrue: [
		self unhandledErrorDefaultAction: aMessage argument.
	].

	(aMessage selector == #runAll) ifTrue: [
		self traceCr: 'Proxying runAll'.
		^ self runAllForSuit: anObject suite.
	].

	^ aMessage sendTo: anObject.

]

{ #category : #'HDTestReport Proxing' }
FileOutErrorsProxyHandler >> runAllForSuit: aTestSuit [

	CurrentExecutionEnvironment runTestsBy: [ 
		self enableFileOutErrorTestService.
		aTestSuit tests do: [ :each | each run: self ]
	]

	
]

{ #category : #'UIHandler Proxing' }
FileOutErrorsProxyHandler >> unhandledErrorDefaultAction: anException [

	self generateFileFrom: anException.
]
