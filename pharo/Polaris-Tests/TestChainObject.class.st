Class {
	#name : #TestChainObject,
	#superclass : #TestCase,
	#category : #'Polaris-Tests'
}

{ #category : #tests }
TestChainObject >> test_chain_calling_proxy [

	self assert: (ChainProxyTester chain proxy: 'An object')
		  equals: 'An object proxied'.
]

{ #category : #tests }
TestChainObject >> test_chain_n_levels [

	self assert: ('{1} xain n levels remove this     ' chain 
					  format: {'Test'};
					  copyReplaceAll: 'xain' with: 'chain';
					  copyReplaceAll: 'remove this' with: '';
					  trim
					 ) 
		  equals: 'Test chain n levels'.
]
