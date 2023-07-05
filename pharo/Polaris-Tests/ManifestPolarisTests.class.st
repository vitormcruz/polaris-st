"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPolarisTests,
	#superclass : #PackageManifest,
	#category : #'Polaris-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestPolarisTests class >> ruleReAsClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PolPolarisNewDefaultProjectITTest #test_new_project_baseline_should_be_created #false)) #'2023-02-15T16:52:38.534-03:00') #(#(#RGPackageDefinition #(#'Polaris-Tests')) #'2023-02-16T15:30:41.416-03:00') )
]
