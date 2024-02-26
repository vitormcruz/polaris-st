Trait {
	#name : #TPolExecExtensionsForActivateMethod,
	#category : #'Polaris-Core-Project-Decorator-MethodActivate'
}

{ #category : #baselines }
TPolExecExtensionsForActivateMethod >> executeActivateExtensions [

	| pragmasInOrder |
	
	pragmasInOrder := SortedCollection sortUsing: [ :p1 :p2 | (p1 argumentAt: 1) < (p2 argumentAt: 1) ].

	self class chain 
		methods;
	 	collect: #pragmas;
		flattened;
		select: [ :pragma | pragma message selector = #PolarisAddedMethodOrder: ];
		in: [ :polarisPragmas | pragmasInOrder addAll: polarisPragmas ].
	
	pragmasInOrder do: [ :pragma | pragma method valueWithReceiver: self arguments: {} ].
	
]
