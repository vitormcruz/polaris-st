Extension { #name : #UIManager }

{ #category : #'*Polaris-Core' }
UIManager class >> decorateCurrentDefaultManagerWith: aProxyHandler [

	Default := AvForwardingProxy target: Default
	 			          			    handler: aProxyHandler.
	
]

{ #category : #'*Polaris-Core' }
UIManager class >> stopDecoratingDeafultManager [

	"yourself has the effect of removing the subject object from the proxy created by #decorateCurrentDefaultManagerWith:. 
	If not proxied, the following code does nothing, as it changes Default by itself."
	Default := Default yourself.
	
]
