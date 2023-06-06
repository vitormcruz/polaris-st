Class {
	#name : #PolPolarisNewProjectTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#category : #'Polaris-Tests'
}

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_app_class_should_be_created [


	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self shouldnt: [ 'PolarisTestProjectMain' asClass ] raise: NotFound.
	
	self assert: 'PolarisTestProjectMain' asClass superclass equals:  CommandLineHandler.
	
	self assert: ((RPackage organizer packageNamed: 'PolarisTestProject-Config') definedClasses includes: #PolarisTestProjectMain asClass) 
		  description: 'App class should be created inside the correct package'.
	
	
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_baseline_method_should_be_created [

	Polaris newProjectNamed: 'PolarisTestProject'.
	self assert: ('BaselineOfPolarisTestProject' asClass selectors includes: #baseline:).
	self assert: ('BaselineOfPolarisTestProject' asClass compiledMethodAt: #baseline:) protocol
        equals: 'baseline'
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_baseline_method_should_have_default_configuration [

	| baselineSpecBuilt |
	
	Polaris newProjectNamed: 'PolarisTestProject'.
	baselineSpecBuilt := (MetacelloBaselineConstructor on: 'BaselineOfPolarisTestProject' asClass new) root.
	
	baselineSpecBuilt	packageNamed: 'Buoy' ifAbsent: [ self fail: 'Buoy should be found' ];
		packageNamed: 'Buoy-Tests'	ifAbsent: [ self fail: 'Buoy-Tests should be found' ];
		packageNamed: 'Tome'	ifAbsent: [ self fail: 'Tome should be found' ];
		packageNamed: 'Grease' ifAbsent: [ self fail: 'Grease should be found' ];
		packageNamed: 'MaterialDesignLite' ifAbsent: [ self fail: 'MaterialDesignLite should be found' ];
		packageNamed: 'ValidationNotification' ifAbsent: [ self fail: 'ValidationNotification should be found' ];
		packageNamed: 'PolarisTestProject-Core' ifAbsent: [ self fail: 'PolarisTestProject-Core should be found' ];
		packageNamed: 'PolarisTestProject-Adapter' ifAbsent: [ self fail: 'PolarisTestProject-Adapter should be found' ];
		packageNamed: 'PolarisTestProject-Config' ifAbsent: [ self fail: 'PolarisTestProject-Config should be found' ];
		packageNamed: 'PolarisTestProject-Tests' ifAbsent: [ self fail: 'PolarisTestProject-Tests should be found' ];
		packageNamed: 'PolarisTestProject-AcceptanceCriteria' ifAbsent: [ self fail: 'PolarisTestProject-AcceptanceCriteria should be found' ].
		
	self assert: (baselineSpecBuilt packageNamed: 'default') includes asSet equals: #('dev') asSet.
	self assert: (baselineSpecBuilt packageNamed: 'core') includes asSet equals: #('PolarisTestProject-Config' 'ValidationNotification') asSet.
	self assert: (baselineSpecBuilt packageNamed: 'test') includes asSet equals: #('core' 'PolarisTestProject-Tests' 'PolarisTestProject-AcceptanceCriteria') asSet.
	self assert: (baselineSpecBuilt packageNamed: 'dev') includes asSet equals: #('test' 'Seaside-Dev') asSet.		

]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_baseline_should_be_created [


	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self assert: (RPackage organizer includesPackageNamed: 'BaselineOfPolarisTestProject') 
		  description: 'Should create a package named: ', 'BaselineOfPolarisTestProject'.
		
	self shouldnt: [ 'BaselineOfPolarisTestProject' asClass ] raise: NotFound.
	
	self assert: ((RPackage organizer packageNamed: 'BaselineOfPolarisTestProject') definedClasses includes: #BaselineOfPolarisTestProject asClass) 
		  description: 'Baseline class should be created inside the correct package'.	
	
	
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_default_packages_should_be_created [

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
PolPolarisNewProjectTest >> test_new_project_seaside_web_app_class_should_be_created [


	Polaris newProjectNamed: 'PolarisTestProject'.
	
	self shouldnt: [ 'PolarisTestProjectWebPage' asClass ] raise: NotFound.
	
	self assert: 'PolarisTestProjectWebPage' asClass superclass equals: MDLApplication.
	
	self assert: ((RPackage organizer packageNamed: 'PolarisTestProject-Adapter-Seaside') definedClasses includes: #PolarisTestProjectWebPage asClass) 
		  description: 'WebApp class should be created inside the correct package'.
	
	
]
