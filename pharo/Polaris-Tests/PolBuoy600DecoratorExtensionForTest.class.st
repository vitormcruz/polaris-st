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

	 spec baseline: 'Buoy2' with: [ spec repository: 'github://ba-st/Buoy:v6.0.0/source' ].
	 spec group:  'core' with: #('Buoy2' ).
]

{ #category : #decorating }
PolBuoy600DecoratorExtensionForTest >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	^ #addBuoyDependencyTo:
]
