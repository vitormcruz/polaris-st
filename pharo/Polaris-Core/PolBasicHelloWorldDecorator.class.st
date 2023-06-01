Class {
	#name : #PolBasicHelloWorldDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#instVars : [
		'project'
	],
	#category : #'Polaris-Core-Decorator'
}

{ #category : #configuration }
PolBasicHelloWorldDecorator >> decorate [

	"Will be called during the project creation to make it's decoration "
	
	(Object << 'HelloWorld' asSymbol)
			slots: {  };
		   package: project projectName, '-Core';
		   install.
		
	(Object << ('HelloWorld', 'Test') asSymbol)
			slots: {  };
		   package: project projectName, '-Tests';
		   install.
]

{ #category : #configuration }
PolBasicHelloWorldDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Add to the project a small core class with a simple ''Hello World'' and a Test Class'
]
