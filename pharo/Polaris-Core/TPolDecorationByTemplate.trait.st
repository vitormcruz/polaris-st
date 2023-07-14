Trait {
	#name : #TPolDecorationByTemplate,
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #copying }
TPolDecorationByTemplate >> copyTemplateClass: aClass replacingAll: aListOfStrings by: aListOfreplacements [

	| sourceOfClass sourceOfClassAltered |
	
	aClass ifNil: [ self error: 'Cannot use nil as a template class' ].

	sourceOfClass := String streamContents: [ :s | aClass fileOutOn: s ].

	sourceOfClassAltered := sourceOfClass copyReplacingAll:  aListOfStrings
											           respectivelyBy:  aListOfreplacements.

	CodeImporter evaluateFileStream: sourceOfClassAltered readStream.
]
