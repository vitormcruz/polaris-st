Class {
	#name : #PolOkMethodDecoratorExtensionForTest,
	#superclass : #Object,
	#traits : 'TPolBaselineDecoratorExtension',
	#classTraits : 'TPolBaselineDecoratorExtension classTrait',
	#category : #'Polaris-Tests-Project-Decorator-Baseline'
}

{ #category : #decorating }
PolOkMethodDecoratorExtensionForTest >> addPragmedDependencyTo: spec [

	<PolarisAddedMethod>
	
	 spec baseline: 'TPolTestProject_Dep3' with: [ spec repository: 'github://vitormcruz/polaris-st:main/pharo' ].
	 spec group:  'core' with: #('TPolTestProject_Dep3' ).

]

{ #category : #decorating }
PolOkMethodDecoratorExtensionForTest >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	^ #addPragmedDependencyTo:
]
