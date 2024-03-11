Class {
	#name : #PolHelloWorldFeatureDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #configuration }
PolHelloWorldFeatureDecorator >> decorateWithMe [

	<todo: 'Add tests?'>

	^ (TomeFeature  << (project projectNamePrefixedAcronym, 'HelloWorldFeature') asSymbol)
			slots: {  };
			package: project projectName, '-AcceptanceCriteria';
			install.
]

{ #category : #configuration }
PolHelloWorldFeatureDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Creates a HelloWorld Feature using Tome.'
]
