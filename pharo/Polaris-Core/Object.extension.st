Extension { #name : #Object }

{ #category : #'*Polaris-Core' }
Object >> chain [
	"Starts a chained operation"
	
	^ AvDelegationProxy target: Object new 
							  handler: (ChainHandler new proxy: self).
]

{ #category : #'*Polaris-Core' }
Object >> ifNil: aBlock else: anElseBlock [

	self ifNil: aBlock ifNotNil: anElseBlock.
]
