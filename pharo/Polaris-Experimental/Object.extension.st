Extension { #name : #Object }

{ #category : #'*Polaris-Experimental' }
Object >> chain [
	"Starts a chained operation"
	
	^ AvDelegationProxy target: Object new 
							  handler: (ChainHandler new proxy: self).
]

{ #category : #'*Polaris-Experimental' }
Object >> ifNil: aBlock else: anElseBlock [

	self ifNil: aBlock ifNotNil: anElseBlock.
]
