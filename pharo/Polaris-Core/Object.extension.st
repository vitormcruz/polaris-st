Extension { #name : #Object }

{ #category : #'*Polaris-Core' }
Object >> ifNil: aBlock else: anElseBlock [

	^ self ifNil: aBlock ifNotNil: anElseBlock.
]
