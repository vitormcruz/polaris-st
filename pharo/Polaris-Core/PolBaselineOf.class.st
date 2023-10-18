"
I am a general Baseline for Projects bootstraped by `Polaris class`. I basically look for methods annotated with `<PolarisAddedMethod>` and 
execute them passing the `spec` parameter so that baseline configution added by polaris are applyed. 

One can call those methods manually or copy paste them into the baseline and remove me entirelly from project
"
Class {
	#name : #PolBaselineOf,
	#superclass : #BaselineOf,
	#category : #'Polaris-Core-Project'
}

{ #category : #baselines }
PolBaselineOf >> baseline: "MetacelloBaselineCosntructor" spec [

	self class methods do: [ :method | 
		(method hasPragmaNamed:  #PolarisAddedMethod) ifTrue: [ method valueWithReceiver: self arguments: {spec} ]
		
	]
	


	
]
