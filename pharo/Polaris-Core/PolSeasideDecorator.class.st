Class {
	#name : #PolSeasideDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolSeasideDecorator >> decorate [

	| sourceOfClass sourceOfClassAltered |

	sourceOfClass := String streamContents: [ :s | TemplateSeasideWebPage fileOutOn: s ].

	sourceOfClassAltered := sourceOfClass copyReplacingAll:  #('TemplateSeasideWebPage' 	'Polaris-Core-Template-Seaside' '''<projectTitle>''') 
												    respectivelyBy: { project projectName,'WebPage'. project projectName, '-Adapter-Seaside'. project projectName. }.

	CodeImporter evaluateFileStream: sourceOfClassAltered readStream.
]

{ #category : #configuration }
PolSeasideDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Add to the project a Basic configuration for the Seaside framework'
]
