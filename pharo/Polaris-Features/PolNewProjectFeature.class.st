Class {
	#name : #PolNewProjectFeature,
	#superclass : #TomeFeature,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#instVars : [
		'configurationByKeyName'
	],
	#category : #'Polaris-Features'
}

{ #category : #scenarios }
PolNewProjectFeature >> Create_a_Command_Line_New_Project [

   <scenario>
   ^ self
        scenario: 'Creating a New Command Line Project'
        def:	'Given a new project named "BlogProject"
					 When I try to create it with Polaris using "Command Line" configuration
					 Then the project is created with minimal configuration and with:
					  - A "BlogProjectMain" class that subclasses from "equals: ''CommandLineHandler''"  
					  - The main class must have a method named "equals: ''activate''"
					  - When called, the activation method should return the message "equals: ''Configure here the startup of your application''"'
        run: [ :projectName :projectConfigurationName :mainClassName :assertMainSuperclass :assertActivateMethod :assertActivateResult |
				assertMainSuperclass testFailFor: (self classNameIfExists: mainClassName).
				assertActivateMethod testFailFor: (self findMethod: 'activate' onClassName: mainClassName).
				assertActivateResult testFailFor: ([ mainClassName asClass new activate ] on: NotFound do: [ '' ]).
				
				(Polaris configureNewProject: projectName) 
					becomeMinimal; 
					addDecorators: {self decoratorFor: projectConfigurationName };
					build.
					
				assertMainSuperclass assertSuccessFor: mainClassName asClass superclass name.
				assertActivateMethod assertSuccessFor: (self findMethod: #activate onClassName: mainClassName).
				assertActivateResult assertSuccessFor: ([ mainClassName asClass new activate ] on: NotFound do: [ '' ]).
        ]
]

{ #category : #scenarios }
PolNewProjectFeature >> Create_a_Minimal_New_Project [

   <scenario>
   ^ self
        scenario: 'Creating a New Minimal Project'
        def:	'Given a new project named "BlogProject"
					 When I try to create it with Polaris using minimal configuration
					 Then the project is created with:
					  - A simple class named "equals: ''BaselineOfBlogProject''" ;
					  - A "equals: ''baseline:''" method;
					  - The following created packages: "equals: ''BlogProject-Adapter, BlogProject-Config,', 
					 ' BlogProject-Core, BlogProject-Tests, BlogProject-Tools, BlogProject-Tools-Polaris''"'
        run: [ :projectName :assertBaselineClass :assertBaselineMethodName :assertPackagesCreated |
				assertBaselineClass testFailFor: (self classNameIfExists: projectName).
				assertBaselineMethodName testFailFor: (self baselineMethodNameForProject: projectName).
				assertPackagesCreated testFailFor: (self packagesNamesForProject: projectName).
				Polaris newMinimalProjectNamed: projectName.
				assertBaselineClass assertSuccessFor: (self classNameIfExists: 'BaselineOf' , projectName).
				assertBaselineMethodName assertSuccessFor: (self baselineMethodNameForProject: projectName).
				assertPackagesCreated assertSuccessFor: (self packagesNamesForProject: projectName).
        ]
]

{ #category : #'test util' }
PolNewProjectFeature >> decoratorFor: aConfigurationKeyName [

	^ configurationByKeyName at: aConfigurationKeyName.
]

{ #category : #'test util' }
PolNewProjectFeature >> findMethod: aSelector onClassName: aClassName [

	"Return the method symbol or blank if not found."
	
	[ aClassName asClass methodDict at: aSelector ifPresent: [ ^ aSelector ] ] 
		on: NotFound do: [ '' ].
		
	^ ''.
]

{ #category : #initialization }
PolNewProjectFeature >> initialize [ 

	configurationByKeyName := { 'Command Line' -> PolCommandLineMainClassDecorator } asDictionary.
]
