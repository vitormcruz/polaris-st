Class {
	#name : #PolarisTestProjectWebPage,
	#superclass : #MDLApplication,
	#category : #'Polaris-Core-Template-Seaside'
}

{ #category : #initialization }
PolarisTestProjectWebPage class >> register_me_as_root_on_server [

	WAAdmin unregister: 'welcome'.
	self registerToDevelopment: '<projectName>'.
]

{ #category : #rendering }
PolarisTestProjectWebPage >> aboutInfoFor: html [

	html mdlNavigationLink id: 'aboutLink'; 
								  url: '#'; 
					  		     with: 'About'.

	html mdlDialog	
		  openButtonId: 'aboutLink';
  		  with: [ 
		  		html mdlDialogTitle: 'Your Title Here'.
			 	html mdlDialogContent: [ html paragraph: 'Dialog Content' ] 
		  ]
]

{ #category : #initialization }
PolarisTestProjectWebPage >> initialize [

	super initialize.
	self primaryColor: MDLColor blue secondaryColor: MDLColor green.
]

{ #category : #rendering }
PolarisTestProjectWebPage >> renderContentOn: html [

	html mdlLayout fixedHeader; with: [ 
		
		html mdlLayoutHeader: [ 
			html mdlLayoutHeaderRow: [ 
				html mdlLayoutTitle: [ html mdlNavigationLink id: 'layoutTitle'; url: '/'; with: '<projectName>' ].
				html mdlLayoutSpacer.
				html mdlNavigation: [ 
					self aboutInfoFor: html.
				].
			] 
		].
	
	]
]

{ #category : #accessing }
PolarisTestProjectWebPage >> style [
	^ '

.mdl-pagination__current{
	box-shadow: inset 0px -4px 0px 0px #69F0AE !!important;
}

#payrollLayoutTitle{
	font-size: 130%;
}
	
'
]

{ #category : #updating }
PolarisTestProjectWebPage >> updateRoot: anHtmlRoot [

    super updateRoot: anHtmlRoot.
    anHtmlRoot title: PolarisTestProject.
]
