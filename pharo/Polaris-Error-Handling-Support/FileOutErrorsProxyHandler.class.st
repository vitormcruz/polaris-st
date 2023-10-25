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

	(aMessage selector == #unhandledErrorDefaultAction:) ifTrue: [
		self unhandledErrorDefaultAction: aMessage argument.
	].

	^ aMessage sendTo: anObject.

]

{ #category : #'UIHandler Proxing' }
FileOutErrorsProxyHandler >> unhandledErrorDefaultAction: anException [

	self generateFileFrom: anException.
]
