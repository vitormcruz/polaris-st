Extension { #name : #String }

{ #category : #'*Polaris-Core' }
String >> copyReplacingAll: oldSubstringsList respectivelyBy: newSubstringsList [

	"Replaces the list of substring list by the respective item from the new substring list. 
	Throw error in case both lists do not have the same size"
	
	"('test' copyReplacingAll: nil respectivelyBy: nil) >>> 'test'"
	"('test' copyReplacingAll: #('t') respectivelyBy: nil) >>> 'test'"
	"('test' copyReplacingAll: nil respectivelyBy: #(noMatter)) >>> 'test'"
	"('test' copyReplacingAll: #('e' 's') respectivelyBy: #('ea' 'po')) >>> 'teapot'"

	
	| newString |
	
	oldSubstringsList ifNil: [ ^self ].
	newSubstringsList ifNil: [ ^self ].
	(oldSubstringsList size ~= newSubstringsList size) ifTrue: [ Error signal: 'Lists sizes don''t match' ].
	 
	newString := self.
	
	oldSubstringsList doWithIndex: [ :oldSubstring :i |
		newString := newString copyReplaceAll: oldSubstring  with: (newSubstringsList at: i)
	].

	^ newString.
]
