"
A PolIcebergManagedDecoratorTest is a test class for testing the behavior of PolIcebergManagedDecorator
"
Class {
	#name : #PolIcebergManagedDecoratorTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #test }
PolIcebergManagedDecoratorTest >> test_repoNameForProject_camel_case_N_name_project [

	| prjMock iceDecorator |
	
	prjMock := Mock new.
	prjMock stub projectName willReturn: 'MyBlogProject'.
	iceDecorator := PolIcebergManagedDecorator new
		                project: prjMock;
		                yourself.

	self	assert: (iceDecorator repoNameForProject)
			equals: 'my-blog-project-st'
]

{ #category : #test }
PolIcebergManagedDecoratorTest >> test_repoNameForProject_messed_N_name_project [

	| prjMock iceDecorator |
	
	prjMock := Mock new.
	prjMock stub projectName willReturn: 'MyblogProjectPrettypretty'.
	iceDecorator := PolIcebergManagedDecorator new
		                project: prjMock;
		                yourself.

	self	assert: (iceDecorator repoNameForProject)
			equals: 'myblog-project-prettypretty-st'
]

{ #category : #test }
PolIcebergManagedDecoratorTest >> test_repoNameForProject_no_upper_N_name_project [

	| prjMock iceDecorator |
	
	prjMock := Mock new.
	prjMock stub projectName willReturn: 'blogproject'.
	iceDecorator := PolIcebergManagedDecorator new
		                project: prjMock;
		                yourself.

	self	assert: (iceDecorator repoNameForProject)
			equals: 'blogproject-st'
]

{ #category : #test }
PolIcebergManagedDecoratorTest >> test_repoNameForProject_no_upper_single_name_project [

	| prjMock iceDecorator |
	
	prjMock := Mock new.
	prjMock stub projectName willReturn: 'blog'.
	iceDecorator := PolIcebergManagedDecorator new
		                project: prjMock;
		                yourself.

	self	assert: (iceDecorator repoNameForProject)
			equals: 'blog-st'
]
