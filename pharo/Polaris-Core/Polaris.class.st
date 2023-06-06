Class {
	#name : #Polaris,
	#superclass : #Object,
	#category : #'Polaris-Core-Core'
}

{ #category : #'project creation' }
Polaris class >> newProjectNamed: projectNameString [

	"Create a new project using defaults configurations"

	self  new newProjectNamed: projectNameString.
]

{ #category : #'project creation' }
Polaris class >> newProjectNamed: projectNameString withAcronym: acronymString [

	"Create a new project using defaults configurations"

	| projectClass projectName2 baselineName |

	projectName2 := acronymString, projectNameString.
	
	projectClass := (PolProject << projectName2 asSymbol)
 			           slots: {  };
		              package: projectNameString, '-Config-Polaris';
		              install.
		
	projectClass class compile: 'projectName', String cr, '    ^ ''', projectNameString, ''''
	 			 	       classified: 'info'.
	
	
	projectClass class compile: 'acronym', String cr, '    ^ ''', acronymString, ''''
					       classified: 'info'.
							

	baselineName := 'BaselineOf' , projectName2.
	projectClass	createBaselineClassUsing: baselineName forProject: projectName2.
	projectClass createMainClassForProject: projectName2.
	PolBasicHelloWorldDecorator decorate: projectClass.
	projectClass	createFeature: 'HelloWorldFeature' forProject: projectName2.
	projectClass createBasicSeasideApplicationForProject: projectName2.
									
	

		


]

{ #category : #'project creation' }
Polaris >> newProjectNamed: projectNameString [


	self newProjectNamed: projectNameString withAcronym: ''.

]

{ #category : #'project creation' }
Polaris >> newProjectNamed: projectNameString withAcronym: acronymString [ 

	| projectClass projectName2 baselineName |

	projectName2 := acronymString, projectNameString.
	
	projectClass := (PolProject << projectName2 asSymbol)
 			           slots: {  };
		              package: projectName2, '-Config-Polaris';
		              install.
		
	projectClass class compile: 'projectName', String cr, '    ^ ''', projectNameString, ''''
	 			 	       classified: 'info'.
	
	
	projectClass class compile: 'acronym', String cr, '    ^ ''', acronymString, ''''
					       classified: 'info'.
							

	baselineName := 'BaselineOf' , projectName2.
	projectClass	createBaselineClassUsing: baselineName forProject: projectName2.
	projectClass createMainClassForProject: projectName2.
	PolBasicHelloWorldDecorator decorate: projectClass.
	projectClass	createFeature: 'HelloWorldFeature' forProject: projectName2.
	projectClass createBasicSeasideApplicationForProject: projectName2.
									
	

		


]
