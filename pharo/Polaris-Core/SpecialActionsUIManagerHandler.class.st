Class {
	#name : #SpecialActionsUIManagerHandler,
	#superclass : #Object,
	#instVars : [
		'subject'
	],
	#category : #'Polaris-Core-Core'
}

{ #category : #'default actions' }
SpecialActionsUIManagerHandler >> buildUniqueErrorFileName [

   ^ (((DateAndTime now asString substrings: '.') at: 1)
         replaceAll: $:
         with: $-) , '.fuel'
]

{ #category : #handling }
SpecialActionsUIManagerHandler >> handleMessage: aMessage toTarget: anObject [

	(aMessage selector == #unhandledErrorDefaultAction:) ifTrue: [
		self unhandledErrorDefaultAction: aMessage argument.
	].

	(aMessage selector == #bla) ifTrue: [
		^ 'Vitor esteve aqui.'
	].	

	^ aMessage sendTo: anObject.

]

{ #category : #'default actions' }
SpecialActionsUIManagerHandler >> unhandledErrorDefaultAction: anException [

   | errorFilePath errorFileName |
   errorFilePath := FileSystem disk workingDirectory / 'fueled_out_errors'.
   errorFilePath ensureCreateDirectory.
   errorFileName := (errorFilePath / self buildUniqueErrorFileName) fullName.

	Smalltalk logDuring: [ :logger | logger nextPutAll: 'Creating fueled out error on: ', errorFileName; cr].

   anException signalerContext serializeToFileNamed: errorFileName
]
