Class {
	#name : #PolDecorationByTemplateTraitTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #tests }
PolDecorationByTemplateTraitTest >> test_copyTemplateClass_replacingAll_by_finding_nothing_to_change [

	
    self should: [ PolDummyDecorator new copyTemplateClass: DummyTemplateClass replacingAll: #('AAAAA' 'BBBBB') by: #('XXXXX' 'ZZZZZ') ] 
         raise: ValidationErrorException
         withExceptionDo: [ :exp | 
			     self assertCollection: exp errorMessages includesAll: #('No changes were applied to the template')
			 ]
									  
	





]

{ #category : #tests }
PolDecorationByTemplateTraitTest >> test_copyTemplateClass_replacingAll_by_with_empty_replacement_lists [

    self should: [ PolDummyDecorator new copyTemplateClass: DummyTemplateClass replacingAll: #() by: #() ] 
         raise: ValidationErrorException
         withExceptionDo: [ :exp | 
			     self assertCollection: exp errorMessages 
						  includesAll: #('List of strings to be replaced cannot be empty' 'List of replacing strings cannot be empty')
			 ]
]

{ #category : #tests }
PolDecorationByTemplateTraitTest >> test_copyTemplateClass_replacingAll_by_with_inexistent_class [





]

{ #category : #tests }
PolDecorationByTemplateTraitTest >> test_copyTemplateClass_replacingAll_by_with_nil_mandatory_args [

    self should: [ PolDummyDecorator new copyTemplateClass: nil replacingAll: nil by: nil ] 
         raise: ValidationErrorException
         withExceptionDo: [ :exp | 
			     self assertCollection: exp errorMessages 
						  includesAll: #('Cannot use nil as a template class' 'List of strings to be replaced cannot be nil' 'List of replacing strings cannot be nil')
			 ]

]

{ #category : #tests }
PolDecorationByTemplateTraitTest >> test_copyTemplateClass_replacingAll_by_with_replacement_lists_with_different_size [





]
