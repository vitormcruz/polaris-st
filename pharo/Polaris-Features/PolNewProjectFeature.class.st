Class {
	#name : #PolNewProjectFeature,
	#superclass : #TomeFeature,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#category : #'Polaris-Features'
}

{ #category : #features }
PolNewProjectFeature >> Create_a_Minimal_New_Project [

   <scenario>
   ^ self
        scenario: 'Creating a New Minimal Project'
        def: 'Given a new project named "BlogProject"
        			      When I try to create it with Polaris with minimal configuration
                      Then the project is created with a simple class named "equals: ''BaselineOfBlogProject''" 
                      and a "equals: ''baseline''" method
                      '
        run: [ :projectName :assertBaselineClass :assertBaselineMethodName |
           assertBaselineClass testFailFor: (self existingBaselineNameForProject: projectName).
           Polaris newMinimalProjectNamed: projectName.
           assertBaselineClass testSucessFor: (self existingBaselineNameForProject: projectName)
        ]
]

{ #category : #features }
PolNewProjectFeature >> existingBaselineNameForProject: projectName [

    "Return the corresponding a Baseline Name for the provided projectName if it exists or an empty
     string otherwise."

    ^ [ ('BaselineOf' , projectName) asClass name ] on: NotFound do: [ '' ]
]
