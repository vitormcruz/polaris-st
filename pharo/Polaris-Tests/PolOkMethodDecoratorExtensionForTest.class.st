Class {
	#name : #PolOkMethodDecoratorExtensionForTest,
	#superclass : #Object,
	#traits : 'TPolBaselineDecoratorExtension',
	#classTraits : 'TPolBaselineDecoratorExtension classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #decorating }
PolOkMethodDecoratorExtensionForTest >> addPragmedDependencyTo: spec [

	<PolarisAddedMethod>
	
	<todo: 'adicionar versão do tome quando tiver.'>
	
	 spec baseline: 'Tome' with: [ spec repository: 'github://vitormcruz/polaris-st:branchForTest/pharo'; loads: #(core) ].
	 spec group:  'test' with: #('Tome' ).

]

{ #category : #decorating }
PolOkMethodDecoratorExtensionForTest >> baselineMethodTemplate [
	"Should return a selector refering to the method template  that should be installed into the base line"

	^ #addPragmedDependencyTo:
]
