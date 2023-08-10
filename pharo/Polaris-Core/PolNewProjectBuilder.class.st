"
I am used to configure a new Project to be bootstraped. See `Polaris class` for genereal details on how to bootstrap new Projects.



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

{ #category : #building }
PolNewProjectBuilder >> createProjectMetaClass [

	| projectClass projNamePrefixed |
	projNamePrefixed := acronym , projectName.

	projectClass := (PolProject << projNamePrefixed asSymbol)
		                slots: {  };
		                package: projectName , '-Tools-Polaris';
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
	decorators := { PolBaselineDecorator. PolCommandLineMainClassDecorator. 
					   PolBasicHelloWorldDecorator. PolHelloWorldFeatureDecorator. 
					   PolSeasideDecorator. } asOrderedCollection 
]

{ #category : #config }
PolNewProjectBuilder >> minimalConfig [


	^ {PolBaselineDecorator} asOrderedCollection.
]

{ #category : #accessing }
PolNewProjectBuilder >> projectName [

	^ projectName
]

{ #category : #accessing }
PolNewProjectBuilder >> projectName: aProjectNameString [

	projectName := aProjectNameString
]