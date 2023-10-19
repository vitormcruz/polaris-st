Class {
	#name : #BaselineOfPolaris,
	#superclass : #BaselineOf,
	#category : #BaselineOfPolaris
}

{ #category : #patching }
BaselineOfPolaris class >> applyPatchTonelWriterSelectorWithComments [

   "see https://github.com/pharo-project/pharo/issues/14569"

	TonelWriter compile: 'splitMethodSource: aMethodDefinition into: aBlock
	| keywords source declaration |

	keywords := aMethodDefinition selector keywords.
	source := aMethodDefinition source readStream.
	"Skip spaces"
	(source peek isSeparator) ifTrue: [ self skipSeparators: source ].
	"Skip comments"
	(source peek = $") ifTrue: [ self skipComment: source ].
	"Parse declaration"
	declaration := String new writeStream.
	[ (self selectorIsComplete: keywords in: declaration originalContents) not
		or: [ '':+-/\*~<>=@,%|&?!'' includes: declaration contents trimRight last ] ]
	whileTrue: [
		"stop infinite loop if no match was found"
		source atEnd ifTrue: [ TonelWriteError signal: ''Cannot find selector in source for '', aMethodDefinition asString ].
		"get separators"
		[ source atEnd not and: [ source peek isSeparator ] ]
			whileTrue: [ declaration nextPut: source next ].
		"get possible comments"	
		[ source peek = $" ] 
			whileTrue: [ 
				declaration nextPut: source next.
		 	  [ source peek ~= $" ]
			 	  whileTrue: [ 
				 	  source atEnd ifTrue: [ TonelWriteError signal: ''Cannot find selector in source for '', aMethodDefinition asString ].
			   	  declaration nextPut: source next.		
					].
			  declaration nextPut: source next.
   	                  "get separators"
  		          [ source atEnd not and: [ source peek isSeparator ] ]
			       whileTrue: [ declaration nextPut: source next ].
		].
		"take next word until we find a separator or a dot"
		[ source atEnd not and: [ source peek ~= $. and: [ source peek isSeparator not ] ] ]
			whileTrue: [ declaration nextPut: source next ] ].
	aBlock
		value: (declaration contents trimLeft withLineEndings: self newLine)
		value: (source upToEnd withLineEndings: self newLine)
	
	'
]

{ #category : #'class initialization' }
BaselineOfPolaris class >> initialize [ 

	self applyPatchTonelWriterSelectorWithComments.
]

{ #category : #baselines }
BaselineOfPolaris >> baseline: "MetacelloBaselineCosntructor" spec [

	<baseline>
        
    spec for: #'common' do: [
        spec blessing: #'baseline';     

             baseline: 'Avatar' with: [ spec repository: 'github://vitormcruz/avatar:createBaseline'; loads: #(core) ];	
					baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
                 project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];

             baseline: 'Mocketry'  with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.2' ];
             baseline: 'MaterialDesignLite'	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.4.2/src'; loads: #(core) ];	
             baseline: 'ValidationSensor' with: [ spec repository: 'github://vitormcruz/validation-sensor:master/pharo'; loads: #(core) ];
             package: 'Polaris-Core' with: [ spec requires: #('MaterialDesignLite' 'ValidationSensor') ];
             package: 'Polaris-Experimental' with: [ spec requires: #('Avatar') ];
             package: 'BaselineOfTPolTestProject'; 
             package: 'BaselineOfTPolTestProject_Dep1';
             package: 'BaselineOfTPolTestProject_Dep2'; 
             package: 'BaselineOfTPolTestProject_Dep3'; 
             package: 'Polaris-Tests' with: [ spec requires: #('Polaris-Core' 'BaselineOfTPolTestProject' 'BaselineOfTPolTestProject_Dep1' 
                                                               'BaselineOfTPolTestProject_Dep2' 'BaselineOfTPolTestProject_Dep3' 'Buoy-Tests' 
                                                               'Mocketry') ];
             package: 'Polaris-Experimental-Tests' with: [ spec requires: #('Polaris-Experimental') ];
             package: 'Polaris-Core' with: [ spec requires: #(Avatar) ];
             package: 'Polaris-Tools-Inspector' with: [ spec requires: #('Polaris-Core') ].

        spec group: 'core' with: #('Polaris-Core' 'Polaris-Experimental' 'ValidationSensor' );
             group: 'test' with: #(core 'Polaris-Tests' 'Polaris-Experimental-Tests');
             group: 'experimental-only' with: #('Polaris-Experimental');
             group: 'dev' with: #(test 'Polaris-Tools-Inspector').	
	 ]
]
