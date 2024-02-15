"
I am used to configure and build new Project in detail, see `Polaris class` for general ways of bootstraping new Projects.

Use `PolNewProjectBuild class>>#withProjectName:andAcronym:` to create a new default configured builder project. A name must be provided, but the acronym can be empty. Configuration is made by applying or removing decorators to the project build, and it can be done by the messages in the ""confi"" protocol:

- becomeMinimal: apply the `minimalConfig` list of decorator to the project builder;
- addDecorators: add a list of decorator to the project builds. See all the provided decorator on `#Polaris-Core-Project-Decorator` package.



"
Class {
	#name : #PolNewProjectBuilder,
	#superclass : #Object,
	#instVars : [
		'projectName',
		'acronym',
		'decorators'
	],
	#category : #'Polaris-Core-Project'
}

{ #category : #'instance creation' }
PolNewProjectBuilder class >> withProjectName: projectNameString andAcronym: acronymString [

	^ self new projectName: projectNameString; 
				  acronym: acronymString.
]

{ #category : #accessing }
PolNewProjectBuilder >> acronym [

	^ acronym
]

{ #category : #accessing }
PolNewProjectBuilder >> acronym: anObject [

	acronym := anObject
]

{ #category : #config }
PolNewProjectBuilder >> addDecorators: aCollection [ 

	decorators addAll: aCollection.
]

{ #category : #config }
PolNewProjectBuilder >> becomeMinimal [

	decorators := self minimalConfig. 
]

{ #category : #building }
PolNewProjectBuilder >> build [
	"Create a new project using the configuration provided"

	| projectClass |
	
	projectClass := self createProjectMetaClass.
	decorators do: [ :decorator |  decorator decorate: projectClass ].
]

{ #category : #config }
PolNewProjectBuilder >> cleanConfig [

	decorators removeAll.
]

{ #category : #building }
PolNewProjectBuilder >> createProjectMetaClass [

	| projectClass projNamePrefixed |
	projNamePrefixed := acronym , projectName.

	projectClass := (PolProject << projNamePrefixed asSymbol)
		                slots: {  };
								tag: 'Polaris';
		                package: projectName , '-Tools';
		                install.

	projectClass class
		compile: 'projectName' , String cr , '    ^ ''' , projectName , ''''
		classified: 'info'.


	projectClass class
		compile: 'acronym' , String cr , '    ^ ''' , acronym , ''''
		classified: 'info'.
	^ projectClass
]

{ #category : #accessing }
PolNewProjectBuilder >> decorators [
	^ decorators
]

{ #category : #initialization }
PolNewProjectBuilder >> initialize [ 

	super initialize.
	
	"Default decorators"
	decorators := { PolMinimalBaselineDecorator. PolCommandLineMainClassDecorator. 
					   PolBasicHelloWorldDecorator. PolHelloWorldFeatureDecorator. 
					   PolSeasideDecorator. } asSet
]

{ #category : #config }
PolNewProjectBuilder >> minimalConfig [


	^ {PolMinimalProjectDecorator} asOrderedCollection.
]

{ #category : #accessing }
PolNewProjectBuilder >> projectName [

	^ projectName
]

{ #category : #accessing }
PolNewProjectBuilder >> projectName: aProjectNameString [

	projectName := aProjectNameString
]
