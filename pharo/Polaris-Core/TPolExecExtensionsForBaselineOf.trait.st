"
I am a trait that can be used by BaselineOf subclasses to execute configuration methods added with the `<PolarisAddedMethod>`.
I just provide a method that executes all methods with that pragma in the correct order.

Usage:

	In your `baseline:` method, before any configuration, just call:
	
	`self executeExtensionsConfigsFor: spec`

"
Trait {
	#name : #TPolExecExtensionsForBaselineOf,
	#category : #'Polaris-Core-Project-Decorator-Baseline'
}

{ #category : #baselines }
TPolExecExtensionsForBaselineOf >> executeExtensionsConfigsFor: "MetacelloBaselineCosntructor" spec [

	self class methods do: [ :method | 
		(method hasPragmaNamed:  #PolarisAddedMethod) ifTrue: [ method valueWithReceiver: self arguments: {spec} ]
		
	]
	


	
]
