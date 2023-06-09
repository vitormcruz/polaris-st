Class {
	#name : #Polaris,
	#superclass : #Object,
	#category : #'Polaris-Core-Core'
}

{ #category : #'project creation' }
Polaris class >> newProjectNamed: projectNameString [

	"Create a new project using defaults configurations"

	self newProjectNamed: projectNameString withAcronym: ''.
]

{ #category : #'project creation' }
Polaris class >> newProjectNamed: projectNameString withAcronym: acronymString [

	"Create a new project using defaults configurations"

	| projectClass projectName2 |

	projectName2 := acronymString, projectNameString.
	
	projectClass := (PolProject << projectName2 asSymbol)
 			           slots: {  };
		              package: projectNameString, '-Config-Polaris';
		              install.
		
	projectClass class compile: 'projectName', String cr, '    ^ ''', projectNameString, ''''
	 			 	       classified: 'info'.
	
	
	projectClass class compile: 'acronym', String cr, '    ^ ''', acronymString, ''''
					       classified: 'info'.
							
	PolBaselineDecorator decorate: projectClass.
	PolCommandLineMainClassDecorator decorate: projectClass.
	PolBasicHelloWorldDecorator decorate: projectClass.
	projectClass	createFeature: 'HelloWorldFeature' forProject: projectName2.
	PolSeasideDecorator decorate: projectClass.
									
	

		


]
