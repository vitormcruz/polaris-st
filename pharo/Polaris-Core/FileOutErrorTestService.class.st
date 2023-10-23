Class {
	#name : #FileOutErrorTestService,
	#superclass : #TestExecutionService,
	#category : #'Polaris-Core-Core'
}

{ #category : #testing }
FileOutErrorTestService class >> isEnabledByDefault [
	^false
]

{ #category : #controlling }
FileOutErrorTestService >> handleException: anUnhandledException [

	self traceCr: 'I am handling exceptions.'
]
