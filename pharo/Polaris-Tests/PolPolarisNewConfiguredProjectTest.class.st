Class {
	#name : #PolPolarisNewConfiguredProjectTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolPolarisNewConfiguredProjectTest >> test_create_project_minimal [

	| projectBuilder baselineSpecBuilt |
	
	self skip: 'Need to finish the baseline extension implementation'.
	
	projectBuilder := (Polaris configureNewProject: 'NewConfiguredTestProject') becomeMinimal.
	projectBuilder build.
	
	baselineSpecBuilt := (MetacelloBaselineConstructor on: 'BaselineOfPolarisTestProject' asClass new) root.
	
	self assertCollection: (baselineSpecBuilt packages list collect: #name)
		  hasSameElements: #('NewConfiguredTestProject-Adapter' 'NewConfiguredTestProject-Config' 
								   'NewConfiguredTestProject-Tests' 'NewConfiguredTestProject-AcceptanceCriteria' 
								   'default' 'core' 'test' 'dev').

		
	self assertCollection:  (baselineSpecBuilt packageNamed: 'default') includes 
		  hasSameElements: #('dev').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'core') includes 
		  hasSameElements: #('NewConfiguredTestProject-Config').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'test') includes 
		  hasSameElements: #('core' 'NewConfiguredTestProject-Tests').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'dev') includes 
		  hasSameElements: #('test').
		
	self assertCollection:  (baselineSpecBuilt packageNamed: 'default') includes 
		  hasSameElements: #('dev').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'core') includes 
		  hasSameElements: #('NewConfiguredTestProject-Core' 'NewConfiguredTestProject-Adapter' 'NewConfiguredTestProject-Config').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'test') includes 
		  hasSameElements: #('core' 'NewConfiguredTestProject-Tests' 'NewConfiguredTestProject-AcceptanceCriteria').
		
	self assertCollection: (baselineSpecBuilt packageNamed: 'dev') includes 
		  hasSameElements: #('test').
	

]
