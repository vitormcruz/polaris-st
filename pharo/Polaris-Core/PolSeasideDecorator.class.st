Class {
	#name : #PolSeasideDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator + TPolDecorationByTemplate',
	#classTraits : 'TPolProjectDecorator classTrait + TPolDecorationByTemplate classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolSeasideDecorator >> decorate [

	<todo: 'Add tests?'>

	self copyTemplateClass:  TemplateSeasideWebPage
		replacingAll:  #('TemplateSeasideWebPage' 	'Polaris-Core-Template-Seaside' '''<projectTitle>''') 
		by: { project projectName,'WebPage'. project projectName, '-Adapter-Seaside'. project projectName. }
]

{ #category : #configuration }
PolSeasideDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Add to the project a Basic configuration for the Seaside framework'
]
