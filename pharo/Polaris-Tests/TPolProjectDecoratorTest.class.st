Class {
	#name : #TPolProjectDecoratorTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #running }
TPolProjectDecoratorTest >> setUp [
	super setUp.

	PolDummyProject clearDecorations.
]

{ #category : #tests }
TPolProjectDecoratorTest >> test_decorate_with_N_dependencies [

	PolNDummyDepDecorator decorate: PolDummyProject.
	self assertCollection: PolDummyProject decorations 
			hasSameElements: { PolNDummyDepDecorator. PolNoDummyDepDecorator. PolNoDummyDepDecorator2. }.
]

{ #category : #tests }
TPolProjectDecoratorTest >> test_decorate_with_One_dependency [

	PolOneDummyDepDecorator decorate: PolDummyProject.
	self assertCollection: PolDummyProject decorations 
			hasSameElements: { PolOneDummyDepDecorator. PolNoDummyDepDecorator }.
]

{ #category : #tests }
TPolProjectDecoratorTest >> test_decorate_with_One_dependency_already_used [

	"Run again should not create a new change from it's dependency"
	PolOneDummyDepDecorator decorate: PolDummyProject.
	PolOneDummyDepDecorator decorate: PolDummyProject.
	 
	self assertCollection: PolDummyProject decorations hasSameElements: { PolNoDummyDepDecorator. PolOneDummyDepDecorator }.
	self assertCollection: PolDummyProject decorationChanges hasSameElements: { 'NoDummyDepChange' }.
]

{ #category : #tests }
TPolProjectDecoratorTest >> test_decorate_with_nil_project [


	self should:  [  PolDummyDecorator  decorate: nil  ]
		raise: Error
		 whoseDescriptionIncludes:  'Cannot decorate a nil Project'
		description:  'Should not be able to decorate a nil Project'.
]

{ #category : #tests }
TPolProjectDecoratorTest >> test_decorate_with_no_dependencies [

	PolNoDummyDepDecorator decorate: PolDummyProject.
	self assertCollection: PolDummyProject decorations 
			hasSameElements: { PolNoDummyDepDecorator }.
]
