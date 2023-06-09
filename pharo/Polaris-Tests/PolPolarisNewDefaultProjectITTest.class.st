Class {
	#name : #PolPolarisNewDefaultProjectITTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#instVars : [
		'packagesCreatedToClean'
	],
	#category : #'Polaris-Tests-Project'
}

{ #category : #tests }
PolPolarisNewDefaultProjectITTest >> test_new_project_app_class_should_have_activate_method [

	| createdClass |
	
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

{ #category : #tests }
PolPolarisNewDefaultProjectITTest >> test_new_project_baseline_should_load_correctly [

	self skip.

	Polaris newProjectNamed: 'PolarisTestProject'.
	"TODO: implement test that loads the projects created and asserts. (Unload?? Too hard to do this right now)"
	
	
	
	
	
]
