Class {
	#name : #TPolSpecialActionsUIManagerTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Core'
}

{ #category : #tests }
TPolSpecialActionsUIManagerTest >> test_fuel_out_on_error [
"
	| aux |
	aux := UIManager default.
	UIManager default: (SpecialActionsUIManagerProxy forUIManager: aux).
	self error: 'Teste'.
	UIManager default: aux."

]
