Extension { #name : #HDTestReport }

{ #category : #'*Polaris-Error-Handling-Support' }
HDTestReport class >> addFileOutErrorAbilityTo: aHDTestReport [

    ^ AvDelegationProxy target: aHDTestReport
                        handler: FileOutErrorsProxyHandler new.
]

{ #category : #'*Polaris-Error-Handling-Support' }
HDTestReport >> suite [

	^ suite.
]
