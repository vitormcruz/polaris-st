Extension { #name : #PolProject }

{ #category : #'*Polaris-Tools-Inspector' }
PolProject class >> inspectProjectIn: specBuilder [
	<inspectorPresentationOrder: 1000 title: 'BlaBla'>
	
	^  specBuilder newRoassal canvas: (RSCanvas new add: (RSLabel new text: 'Hello from Roassal'); yourself ).
]
