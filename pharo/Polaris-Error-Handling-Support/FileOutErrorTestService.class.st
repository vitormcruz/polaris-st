Class {
	#name : #FileOutErrorTestService,
	#superclass : #TestExecutionService,
	#category : #'Polaris-Error-Handling-Support'
}

{ #category : #testing }
FileOutErrorTestService class >> isEnabledByDefault [
	^false
]

{ #category : #'file error creation' }
FileOutErrorTestService >> buildUniqueErrorFileName [

   ^ (((DateAndTime now asString substrings: '.') at: 1)
         replaceAll: $:
         with: $-) , '.fuel'
]

{ #category : #'file error creation' }
FileOutErrorTestService >> generateFileFrom: anException [

   | errorFilePath errorFileName |

   errorFilePath := FileSystem disk workingDirectory / 'fueled_out_errors'.
   errorFilePath ensureCreateDirectory.
   errorFileName := (errorFilePath / self buildUniqueErrorFileName) fullName.

	self traceCr: 'Creating fueled out error on: ', errorFileName.

   anException signalerContext serializeToFileNamed: errorFileName
]

{ #category : #controlling }
FileOutErrorTestService >> handleException: anUnhandledException [

	self generateFileFrom: anUnhandledException.
]
