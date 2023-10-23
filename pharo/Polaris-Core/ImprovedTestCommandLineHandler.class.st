Class {
	#name : #ImprovedTestCommandLineHandler,
	#superclass : #TestCommandLineHandler,
	#category : #'Polaris-Core-Core'
}

{ #category : #accessing }
ImprovedTestCommandLineHandler class >> description [
	^ 'A command line test runner. 
	Use --fileOutErrors to enable file out errors that happens during test execution. Use carefully as files may get big and the execution time will affected 
	as more and more errors get filed out.'
]

{ #category : #'handler selection' }
ImprovedTestCommandLineHandler class >> priority [
	^ 1
]

{ #category : #private }
ImprovedTestCommandLineHandler >> runPackages [
	| packages results |
	
	"(self hasOption: '--fileOutErrors')"
	self traceCr: 'Started tests using decorated UIManager'.
	UIManager decorateCurrentDefaultManagerWith: FileOutErrorsUIManagerProxyHandler new.
	packages := self packages.
	self inform: 'Running tests in ', packages size asString, ' Packages'.
	results := (self testRunner runPackages: self packages) select: #notNil.
	UIManager stopDecoratingDeafultManager. 
	self traceCr: 'Finish tests using decorated UIManager'.	
				
	self informResults: results.
	(self hasOption: 'save') ifTrue: [ Smalltalk saveSession ].
	((self hasOption: 'fail-on-failure') 
		and: [ results anySatisfy: #hasFailuresOrErrors ])
		ifTrue: [^ self exitFailure: 'Tests do not pass!' ].
	((self hasOption: 'fail-on-error') 
		and: [ results anySatisfy: #hasErrors ])
		ifTrue: [^ self exitFailure: 'Tests do not pass!' ].
	
	Smalltalk snapshot: false andQuit: true.
]
