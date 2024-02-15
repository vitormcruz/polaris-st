"
I am Polaris, a facade for functionalities provided by the Polaris Project. You can see everything I can do by looking at my class side messages

## Creating Projects

I can be used to bootstrap commons projects. 

- `Polaris class>>#newProjectNamed:` creates a new Project with the specified name using the default configuration. 
- `Polaris class>>#newminimalProjectNamed:` creates a new Project with the specified name using the minimla configuration, 
basically containing a baseline, the default layers and some example classes.
- The `Polaris class>>#newProjectNamed:withAcronym:` adds an acronym to the created project.

To customize project creation, you can use the equivalent pair of messages `Polaris class>>#configureNewProject:` and `Polaris class>>#configureNewProject:withAcronym:`. Those messages will return a `PolNewProjectBuild`, which you can look at for 
configuration information.

`<todo: 'Detail more and add examples'>`
"
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

	^ PolNewProjectBuilder withProjectName: projectNameString andAcronym: acronymString

		


]

{ #category : #'project creation' }
Polaris class >> newMinimalProjectNamed: projectNameString [

	"Create a new minimal project using defaults configurations"

	(self configureNewProject: projectNameString withAcronym: '') becomeMinimal build.
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
