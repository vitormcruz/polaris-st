"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPolarisFeatures,
	#superclass : #PackageManifest,
	#category : #'Polaris-Features-Manifest'
}

{ #category : #'code-critics' }
ManifestPolarisFeatures class >> ruleReAsClassRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'Polaris-Features')) #'2023-12-15T13:37:45.991-03:00') )
]
