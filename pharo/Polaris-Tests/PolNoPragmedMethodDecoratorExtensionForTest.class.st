Class {
	#name : #PolNoPragmedMethodDecoratorExtensionForTest,
	#superclass : #Object,
	#traits : 'TPolBaselineDecoratorExtension',
	#classTraits : 'TPolBaselineDecoratorExtension classTrait',
	#category : #'Polaris-Tests-Project-Decorator-Baseline'
}

{ #category : #decorating }
PolNoPragmedMethodDecoratorExtensionForTest >> addNotPragmedDependencyTo: spec [

]

{ #category : #'hot spot' }
PolNoPragmedMethodDecoratorExtensionForTest >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	^ #addNotPragmedDependencyTo:
]
