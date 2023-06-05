Extension { #name : #Polaris }

{ #category : #'*Polaris-Tools-Inspector' }
Polaris >> inspectPolarisIn:  specBuilder [
	<inspectorPresentationOrder: 1000 title: 'BlaBla'>
	
	^  specBuilder newRoassal canvas: (RSCanvas new add: (RSLabel new text: 'Hello from Roassal'); yourself ).
]
