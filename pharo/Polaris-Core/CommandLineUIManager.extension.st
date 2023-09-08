Extension { #name : #CommandLineUIManager }

{ #category : #'*Polaris-Core' }
CommandLineUIManager >> quitFrom: aContext withMessage: aString [

	" log error and quit "
	[ Smalltalk
		logError: aString, '   VMD was here'
		inContext: aContext.

	" Print stacks of all current processes "

	Smalltalk logDuring: [:logger |
		logger nextPutAll: 'Processes and their stacks: ';cr.

		Process allInstances do: [:each | | ctx |
			logger nextPutAll: 'Process: '; print: each; cr; nextPutAll: '  stack:'; cr; cr.

			ctx := each isActiveProcess ifTrue: [ thisContext sender ] ifFalse: [ each suspendedContext ].
			ctx ifNotNil: [
				(ctx stackOfSize: 20) do: [:s | logger print: s; cr ]].
			logger nextPutAll: '------------------------------'; cr; cr.
		]].
	] ensure: [ self exitFailure ]
]
