Class {
	#name : #Polaris,
	#superclass : #Object,
	#category : #'Polaris-Core-Core'
}

{ #category : #'project creation' }
Polaris class >> configureNewProject: projectNameString [

	"Create a new project builder using defaults configurations for the project name provided. 
	 Configs can be changed afterwards"

	^ self configureNewProject: projectNameString withAcronym: ''.
]

{ #category : #'project creation' }
Polaris class >> configureNewProject: projectNameString withAcronym: acronymString [

	"Create a new project builder using defaults configurations with the given project name and acronym. 
	 Configs can be changed afterwards"

	^ PolProjectBuilder withProjectName: projectNameString andAcronym: acronymString

		


]

{ #category : #'project creation' }
Polaris class >> newProjectNamed: projectNameString [

	"Create a new project using defaults configurations"

	self newProjectNamed: projectNameString withAcronym: ''.
]

{ #category : #'project creation' }
Polaris class >> newProjectNamed: projectNameString withAcronym: acronymString [

	"Create a new project using defaults configurations with the given project name and acronym"

	(self configureNewProject: projectNameString withAcronym: acronymString) build.
									
	

		


]
