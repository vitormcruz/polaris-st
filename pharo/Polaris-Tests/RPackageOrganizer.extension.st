Extension { #name : #RPackageOrganizer }

{ #category : #'*Polaris-Tests' }
RPackageOrganizer >> packageNamed: aSymbol  ifPresent: foundBlock [
	^ packages 
		at: aSymbol asSymbol 
		ifPresent: foundBlock
]
