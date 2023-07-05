Class {
	#name : #PolBuoy600DecoratorExtensionForTest,
	#superclass : #Object,
	#traits : 'TPolBaselineDecoratorExtension',
	#classTraits : 'TPolBaselineDecoratorExtension classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #decorating }
PolBuoy600DecoratorExtensionForTest >> addBuoyDependencyTo: spec [

	<PolarisAddedMethod>

	 spec baseline: 'BaselineOfTPolTestProject_Dep1_2' with: [ spec repository: 'github://vitormcruz/polaris:branchForTest/pharo' ].
	 spec group:  'core' with: #('BaselineOfTPolTestProject_Dep1_2' ).
]

{ #category : #decorating }
PolBuoy600DecoratorExtensionForTest >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	^ #addBuoyDependencyTo:
]
