Extension { #name : #HDTestReport }

{ #category : #'*Polaris-Error-Handling-Support' }
HDTestReport class >> addFileOutErrorAbilityTo: aHDTestReport [

    ^ AvForwardingProxy target: aHDTestReport
                        handler: FileOutErrorsProxyHandler new.
]

{ #category : #'*Polaris-Error-Handling-Support' }
HDTestReport >> suite [

	^ suite.
]
