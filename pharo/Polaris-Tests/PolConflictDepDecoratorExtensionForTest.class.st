Class {
	#name : #PolConflictDepDecoratorExtensionForTest,
	#superclass : #Object,
	#traits : 'TPolBaselineDecoratorExtension',
	#classTraits : 'TPolBaselineDecoratorExtension classTrait',
	#category : #'Polaris-Tests-Project-Decorator-Baseline'
}

{ #category : #decorating }
PolConflictDepDecoratorExtensionForTest >> addConflictingDependencyTo: spec [

	<PolarisAddedMethod>

	 spec baseline: 'TPolTestProject_Dep2' with: [ spec repository: 'github://vitormcruz/polaris-st:main/pharo' ]. "This dependency has a conflict with TPolTestProject_Dep1 defined at the baseline root"
	 spec group:  'core' with: #('TPolTestProject_Dep2' ).
]

{ #category : #decorating }
PolConflictDepDecoratorExtensionForTest >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	^ #addConflictingDependencyTo:
]
