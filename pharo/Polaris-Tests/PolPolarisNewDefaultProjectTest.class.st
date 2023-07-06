Class {
	#name : #PolPolarisNewDefaultProjectTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_app_class_should_be_created [


	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self shouldnt: [ 'PolarisTestProjectMain' asClass ] raise: NotFound.
	
	self assert: 'PolarisTestProjectMain' asClass superclass equals:  CommandLineHandler.
	
	self assert: ('PolarisTestProject-Config' asPackage definedClasses includes: #PolarisTestProjectMain asClass) 
		  description: 'App class should be created inside the correct package'.
	
	
]

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_baseline_method_should_be_created [

	Polaris newProjectNamed: 'PolarisTestProject'.
	self assert: ('BaselineOfPolarisTestProject' asClass selectors includes: #baseline:).
	self assert: ('BaselineOfPolarisTestProject' asClass compiledMethodAt: #baseline:) protocol
        equals: 'baseline'
]

{ #category : #tests }
PolPolarisNewDefaultProjectTest >> test_new_project_baseline_method_should_have_default_configuration [

	| baselineSpecBuilt |
	
	Polaris newProjectNamed: 'PolarisTestProject'.
	baselineSpecBuilt := (MetacelloBaselineConstructor on: 'BaselineOfPolarisTestProject' asClass new) root.
	
	
	self assertCollection: (baselineSpecBuilt packages list collect: #name)
		  hasSameElements: #('Buoy' 'Buoy-Tests' 'Tome' 'Grease' 'Seaside3' 'Seaside-Core' 'Seaside-Dev' 'MaterialDesignLite' 
								   'ValidationNotification' 'PolarisTestProject-Core' 'PolarisTestProject-Adapter' 'PolarisTestProject-Config' 
								   'PolarisTestProject-Tests' 'PolarisTestProject-AcceptanceCriteria' 'PolarisTestProject-Tools' 
								   'default' 'core' 'test' 'dev').

		
	self assertCollection:  (baselineSpecBuilt packageNamed: 'default') includes 
		  hasSameElements: #('dev').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'core') includes 
		  hasSameElements: #('PolarisTestProject-Core' 'PolarisTestProject-Adapter' 'PolarisTestProject-Config' 'ValidationNotification').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'test') includes 
		  hasSameElements: #('core' 'PolarisTestProject-Tests' 'PolarisTestProject-AcceptanceCriteria').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'dev') includes 
		  hasSameElements: #('test' 'Seaside-Dev' 'PolarisTestProject-Tools').

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
