Class {
	#name : #PolNewProjectFeature,
	#superclass : #TomeFeature,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#category : #'Polaris-Features'
}

{ #category : #scenarios }
PolNewProjectFeature >> Create_a_Minimal_New_Project [

   <scenario>
   ^ self
        scenario: 'Creating a New Minimal Project'
        def:	'Given a new project named "BlogProject"
					 When I try to create it with Polaris with minimal configuration
					 Then the project is created with:
					  - A simple class named "equals: ''BaselineOfBlogProject''" ;
					  - A "equals: ''baseline:''" method;
					  - The following created packages: "equals: ''BlogProject-Adapter, BlogProject-Config, BlogProject-Core, BlogProject-Tests, BlogProject-Tools''"'
        run: [ :projectName :assertBaselineClass :assertBaselineMethodName :assertPackagesCreated |
				assertBaselineClass testFailFor: (self baselineClassNameForProject: projectName).
				assertBaselineMethodName testFailFor: (self baselineMethodNameForProject: projectName).
				assertPackagesCreated testFailFor: (self packagesNamesForProject: projectName).
				Polaris newMinimalProjectNamed: projectName.
				assertBaselineClass assertSuccessFor: (self baselineClassNameForProject: projectName).
				assertBaselineMethodName assertSuccessFor: (self baselineMethodNameForProject: projectName).
				assertPackagesCreated assertSuccessFor: (self packagesNamesForProject: projectName).
        ]
]
