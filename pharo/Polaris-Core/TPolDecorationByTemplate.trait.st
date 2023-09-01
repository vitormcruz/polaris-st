"
I contain messages used for decorators that will take an implemented template and instantiate it in the new project being built.
"
Trait {
	#name : #TPolDecorationByTemplate,
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #copying }
TPolDecorationByTemplate >> copyTemplateClass: aClass replacingAll: "String" tokens by: "String" replacements [

   | sourceOfClass sourceOfClassAltered |

   self validate: aClass aListOfTokens: tokens andReplacements: replacements.

   sourceOfClass := String streamContents: [ :s | aClass fileOutOn: s ].

   sourceOfClassAltered := sourceOfClass copyReplacingAll: tokens
			                                 respectivelyBy: replacements.

   sourceOfClass = sourceOfClassAltered ifTrue: [ self issueErrorAndFail: 'No changes were applied to the template' ].

   CodeImporter evaluateFileStream: sourceOfClassAltered readStream
]

{ #category : #copying }
TPolDecorationByTemplate >> validate: aClass aListOfTokens: "String list" tokens andReplacements: "String list" replacements [

   [	
       aClass ifNil: [ self issueError: 'Cannot use nil as a template class' ]
		         else: [ tokens size ~= replacements size ifTrue: [ self issueError: 'The replacingAll: list must have the same size of the by: one' ] ].

       tokens ifNil: [ self issueError: 'List of strings to be replaced cannot be nil' ]
				           else: [ tokens ifEmpty: [ self issueError: 'List of strings to be replaced cannot be empty' ] ].

       replacements ifNil: [ self issueError: 'List of replacing strings cannot be nil' ]
                           else: [ replacements ifEmpty: [ self issueError: 'List of replacing strings cannot be empty' ] ] 

	] failOnValidationError
]
