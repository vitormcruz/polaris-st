Class {
	#name : #PolBasicHelloWorldDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolBasicHelloWorldDecorator >> decorateWithMe [

	"Will be called during the project creation to make it's decoration "
	
	| acronym |
	
	acronym := project acronym.
	
	(Object << (acronym, 'HelloWorld') asSymbol)
			slots: {  };
		   package: project projectName, '-Core';
		   install.
		
	(Object << (acronym, 'HelloWorldTest') asSymbol)
			slots: {  };
		   package: project projectName, '-Tests';
		   install.
]

{ #category : #configuration }
PolBasicHelloWorldDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Add to the project a small core class with a simple ''Hello World'' and a Test Class'
]
