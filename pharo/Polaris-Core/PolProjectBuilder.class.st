Class {
	#name : #PolProjectBuilder,
	#superclass : #Object,
	#instVars : [
		'projectName',
		'acronym',
		'decorators'
	],
	#category : #'Polaris-Core-Project'
}

{ #category : #'instance creation' }
PolProjectBuilder class >> withProjectName: projectNameString andAcronym: acronymString [

	^ self new projectName: projectNameString; 
				  acronym: acronymString.
]

{ #category : #accessing }
PolProjectBuilder >> acronym [

	^ acronym
]

{ #category : #accessing }
PolProjectBuilder >> acronym: anObject [

	acronym := anObject
]

{ #category : #config }
PolProjectBuilder >> becomeMinimal [

	decorators := self minimalConfig. 
]

{ #category : #building }
PolProjectBuilder >> build [
	"Create a new project using the configuration provided"

	| projectClass |
	
	projectClass := self createProjectMetaClass.
	decorators do: [ :decorator |  decorator decorate: projectClass ].
]

{ #category : #building }
PolProjectBuilder >> createProjectMetaClass [

	| projectClass projNamePrefixed |
	projNamePrefixed := acronym , projectName.

	projectClass := (PolProject << projNamePrefixed asSymbol)
		                slots: {  };
		                package: projectName , '-Config-Polaris';
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
PolProjectBuilder >> decorators [
	^ decorators
]

{ #category : #initialization }
PolProjectBuilder >> initialize [ 

	super initialize.
	
	"Default decorators"
	decorators := { PolBaselineDecorator. PolCommandLineMainClassDecorator. 
					   PolBasicHelloWorldDecorator. PolHelloWorldFeatureDecorator. 
					   PolSeasideDecorator. } asOrderedCollection 
]

{ #category : #config }
PolProjectBuilder >> minimalConfig [


	^ {PolBaselineDecorator} asOrderedCollection.
]

{ #category : #accessing }
PolProjectBuilder >> projectName [

	^ projectName
]

{ #category : #accessing }
PolProjectBuilder >> projectName: anObject [

	projectName := anObject
]
