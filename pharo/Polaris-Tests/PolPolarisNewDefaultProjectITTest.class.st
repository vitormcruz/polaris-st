Class {
	#name : #PolPolarisNewDefaultProjectITTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#instVars : [
		'packagesCreatedToClean'
	],
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolPolarisNewDefaultProjectITTest >> test_new_project_app_class_should_have_activate_method [

	| createdClass |
	
	<todo: 'remover daqui e colcoar em algum scenario'>
	
	Polaris newProjectNamed: 'PolarisTestProject'.
	createdClass := 'PolarisTestProjectMain' asClass.
	
	self assert: (createdClass selectors includes: #activate).

	self assert: ((createdClass compiledMethodAt: #activate) sourceCode copyReplaceAll: ' ' with: '')
		  equals: (('activate
	| adaptor |
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: ''PolarisTestProject''.

	Smalltalk snapshot: false andQuit: false') copyReplaceAll: ' ' with: '' ).
]
