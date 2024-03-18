"
A PolMinimalActivateMethodDecoratorTest is a test class for testing the behavior of PolMinimalActivateMethodDecorator
"
Class {
	#name : #PolMinimalActivateMethodDecoratorTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectTestUtils',
	#classTraits : 'TPolNewProjectTestUtils classTrait',
	#classInstVars : [
		'collectionForTest'
	],
	#category : #'Polaris-Tests-Project-Decorator-MethodActivate'
}

{ #category : #accessing }
PolMinimalActivateMethodDecoratorTest class >> clearCollectionForTest [

	collectionForTest := OrderedCollection new. 
]

{ #category : #accessing }
PolMinimalActivateMethodDecoratorTest class >> collectionForTest [

	^ collectionForTest. 
]

{ #category : #accessing }
PolMinimalActivateMethodDecoratorTest class >> initialize [ 

	collectionForTest := OrderedCollection new. 
]

{ #category : #running }
PolMinimalActivateMethodDecoratorTest >> setUp [

	super setUp.
	
	self cleanZombiePolarisSubscriptions.
	PolDummyProject clearDecorations.
	self class clearCollectionForTest.
	"Was unable to reuse setup from trait, alias isn't working. "
	epiceaMonitorStatusBeforeTests := EpMonitor current isEnabled.
	EpMonitor current disable.
	packagesCreatedToClean := OrderedCollection new.
	methodsToClean := OrderedCollection new.
	subscriptions := OrderedCollection new.
	self instrumentAnnouncements: {	(ClassTagAnnouncement >> #package:).	(MethodAnnouncement >> #method:) }.

	subscriptions add: (SystemAnnouncer uniqueInstance
									when: ClassTagAdded
			 						do: [ :classAddedAnn | self processClassTagAdded: classAddedAnn ]).

	subscriptions add: (SystemAnnouncer uniqueInstance 
									when: MethodAdded 
									do: [ :methodAddedAnn | self handleMethodAdded: methodAddedAnn consideringPackageCreated: packagesCreatedToClean ])
]

{ #category : #tests }
PolMinimalActivateMethodDecoratorTest >> test_decorate_activation_method_with_N_added_methods_in_order [

	| mainClass |
	
	PolMinimalActivateMethodDecorator decorate: PolDummyProject.
	
	mainClass := (PolDummyProject projectName , 'Main') asClass.
	
	mainClass compile: 'addedMethod1
		<PolarisAddedMethodOrder: 3> 
		PolMinimalActivateMethodDecoratorTest collectionForTest add: ''a'''.
		
	mainClass compile: 'addedMethod2
		<PolarisAddedMethodOrder: 2> 
		PolMinimalActivateMethodDecoratorTest collectionForTest add: ''b'''.
		
	mainClass compile: 'addedMethod3
		<PolarisAddedMethodOrder: 1> 
		PolMinimalActivateMethodDecoratorTest collectionForTest add: ''c'''.
		
	mainClass new activate.

	self	assert: (self class collectionForTest reduce: [ :a :b | a,b ] )
			equals: 'cba'.
]

{ #category : #tests }
PolMinimalActivateMethodDecoratorTest >> test_decorate_activation_method_with_no_added_methods [

	| mainObject |
	
	PolMinimalActivateMethodDecorator decorate: PolDummyProject.
	mainObject := (PolDummyProject projectName , 'Main') asClass new.

	self assert: mainObject activate equals: 'Configure here the startup of your application'.
]
