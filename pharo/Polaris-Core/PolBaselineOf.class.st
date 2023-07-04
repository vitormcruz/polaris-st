Class {
	#name : #PolBaselineOf,
	#superclass : #BaselineOf,
	#category : #'Polaris-Core-Project'
}

{ #category : #baselines }
PolBaselineOf >> baseline: spec [

	self class methods do: [ :method | 
		(method hasPragmaNamed:  #PolarisAddedMethod) ifTrue: [ method valueWithReceiver: self arguments: {spec} ]
		
	]
	


	
]
