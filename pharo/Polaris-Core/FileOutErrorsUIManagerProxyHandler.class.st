Class {
	#name : #FileOutErrorsUIManagerProxyHandler,
	#superclass : #Object,
	#category : #'Polaris-Core-Core'
}

{ #category : #'default actions' }
FileOutErrorsUIManagerProxyHandler >> buildUniqueErrorFileName [

   ^ (((DateAndTime now asString substrings: '.') at: 1)
         replaceAll: $:
         with: $-) , '.fuel'
]

{ #category : #handling }
FileOutErrorsUIManagerProxyHandler >> handleMessage: aMessage toTarget: anObject [

	(aMessage selector == #unhandledErrorDefaultAction:) ifTrue: [
		self unhandledErrorDefaultAction: aMessage argument.
	].

	^ aMessage sendTo: anObject.

]

{ #category : #'default actions' }
FileOutErrorsUIManagerProxyHandler >> unhandledErrorDefaultAction: anException [

   | errorFilePath errorFileName |
   errorFilePath := FileSystem disk workingDirectory / 'fueled_out_errors'.
   errorFilePath ensureCreateDirectory.
   errorFileName := (errorFilePath / self buildUniqueErrorFileName) fullName.

	Smalltalk logDuring: [ :logger | logger nextPutAll: 'Creating fueled out error on: ', errorFileName; cr].

   anException signalerContext serializeToFileNamed: errorFileName
]
