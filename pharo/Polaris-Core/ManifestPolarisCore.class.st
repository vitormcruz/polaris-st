"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPolarisCore,
	#superclass : #PackageManifest,
	#category : #'Polaris-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestPolarisCore class >> ruleCollectSelectNotUsedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'Polaris-Core')) #'2024-02-23T16:27:22.271-03:00') )
]
