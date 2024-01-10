"
This class contains tests
"
Class {
	#name : #PolPolarisNewDefaultProjectTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_app_class_should_be_created [

	<todo: 'All the methods from this class showld be created as scenarios on features.'>

	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self shouldnt: [ 'PolarisTestProjectMain' asClass ] raise: NotFound.
	
	self assert: 'PolarisTestProjectMain' asClass superclass equals:  CommandLineHandler.
	
	
	self assertClass: #PolarisTestProjectMain asClass
		  isAtPackage: 'PolarisTestProject-Config' asPackage.
	
	
]

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_baseline_method_should_be_created [

	Polaris newProjectNamed: 'PolarisTestProject'.
	self assert: ('BaselineOfPolarisTestProject' asClass selectors includes: #baseline:).
	self assert: ('BaselineOfPolarisTestProject' asClass compiledMethodAt: #baseline:) protocol
        equals: 'baseline'
]

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_baseline_should_be_created [


	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self assert: (RPackage organizer includesPackageNamed: 'BaselineOfPolarisTestProject') 
		  description: 'Should create a package named: ', 'BaselineOfPolarisTestProject'.
		
	self shouldnt: [ 'BaselineOfPolarisTestProject' asClass ] raise: NotFound.
	
	self assert: ('BaselineOfPolarisTestProject' asPackage definedClasses includes: #BaselineOfPolarisTestProject asClass) 
		  description: 'Baseline class should be created inside the correct package'.	
	
	
]

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_default_packages_should_be_created [

	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self assert: (RPackage organizer includesPackageNamed: 'PolarisTestProject-Core')
		  description: 'Should create a package named: ', 'PolarisTestProject-Core'.
		
   self assert: (RPackage organizer includesPackageNamed: 'PolarisTestProject-Adapter-Seaside')
		  description: 'Should create a package named: ', 'PolarisTestProject-Adapter-Seaside'.
		
   self assert: (RPackage organizer includesPackageNamed: 'PolarisTestProject-Config')
		  description: 'Should create a package named: ', 'PolarisTestProject-Config'.
		
   self assert: (RPackage organizer includesPackageNamed: 'PolarisTestProject-Tests')
		  description: 'Should create a package named: ', 'PolarisTestProject-Tests'.
		
   self assert: (RPackage organizer includesPackageNamed: 'PolarisTestProject-AcceptanceCriteria')
		  description: 'Should create a package named: ', 'PolarisTestProject-AcceptanceCriteria'.
]

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_seaside_web_app_class_should_be_created [


	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self shouldnt: [ 'PolarisTestProjectWebPage' asClass ] raise: NotFound.
	
	self assert: 'PolarisTestProjectWebPage' asClass superclass equals: MDLApplication.
	
	self assert: ('PolarisTestProject-Adapter-Seaside' asPackage definedClasses includes: #PolarisTestProjectWebPage asClass) 
		  description: 'WebApp class should be created inside the correct package'.
	
	
]
