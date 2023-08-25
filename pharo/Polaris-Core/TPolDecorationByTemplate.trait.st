"
I contain messages used for decorators that will take an implemented template and instantiate it in the new project being built.
"
Trait {
	#name : #TPolDecorationByTemplate,
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #copying }
TPolDecorationByTemplate >> copyTemplateClass: aClass replacingAll: aListOfStrings by: aListOfReplacements [

	| sourceOfClass sourceOfClassAltered |
	
	[ 
		aClass ifNil: [ self issueError: 'Cannot use nil as a template class' ].
		aListOfStrings ifNil: [ self issueError: 'List of strings to be replaced cannot be nil' ] 
							  ifNotNil: [ aListOfStrings ifEmpty: [ self issueError: 'List of strings to be replaced cannot be empty' ] ].
							
		aListOfReplacements ifNil: [ self issueError: 'List of replacing strings cannot be nil' ] 
									  ifNotNil: [ aListOfReplacements ifEmpty: [ self issueError: 'List of replacing strings cannot be empty' ] ].
	] failOnValidationError.
									
	sourceOfClass := String streamContents: [ :s | aClass fileOutOn: s ].

	sourceOfClassAltered := sourceOfClass copyReplacingAll:  aListOfStrings
											           respectivelyBy:  aListOfReplacements.
											
	sourceOfClass = sourceOfClassAltered ifTrue: [ self issueErrorAndFail: 'No changes were applied to the template' ].

	CodeImporter evaluateFileStream: sourceOfClassAltered readStream.

]
