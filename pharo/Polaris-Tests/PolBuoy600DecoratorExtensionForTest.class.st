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

	 spec baseline: 'TPolTestProject_Dep1' with: [ spec repository: 'github://vitormcruz/polaris-st:branchForTest/pharo' ].
	 spec group:  'core' with: #('TPolTestProject_Dep1' ).
]

{ #category : #decorating }
PolBuoy600DecoratorExtensionForTest >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	^ #addBuoyDependencyTo:
]
