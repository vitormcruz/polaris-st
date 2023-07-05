Class {
	#name : #PolCommandLineMainClassDecorator,
	#superclass : #Object,
	#traits : 'TPolProjectDecorator',
	#classTraits : 'TPolProjectDecorator classTrait',
	#category : #'Polaris-Core-Project-Decorator'
}

{ #category : #'project creation' }
PolCommandLineMainClassDecorator >> activateMethodSourceForProject: projectName [


	^ 'activate
	| adaptor |
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: ''', projectName , '''.

	Smalltalk snapshot: false andQuit: false'
]

{ #category : #configuration }
PolCommandLineMainClassDecorator >> decorate [

	<todo: 'Add tests?'>

	| appClass appClassPackage |
	appClassPackage := project projectName, '-Config'.

	appClass := (CommandLineHandler << (project projectNamePrefixedAcronym , 'Main') asSymbol)
		            slots: {  };
		            package: appClassPackage;
		            install.


	appClass 	compile: (self activateMethodSourceForProject: project projectName)	classified: 'activate'
]

{ #category : #configuration }
PolCommandLineMainClassDecorator >> description [ 
	
	"Should return a small descripition of this configuration"
	
	^ 'Create a Main class with the configuration to activate the application, enabling it to be used through CommandLine. Can be extended'
]
