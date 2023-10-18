"
I am used to test the delegation of #proxy: messages by the chain operation.
"
Class {
	#name : #ChainProxyTester,
	#superclass : #Object,
	#category : #'Polaris-Experimental-Tests'
}

{ #category : #accessing }
ChainProxyTester class >> proxy: aString [

	^ aString , ' proxied'.
]
