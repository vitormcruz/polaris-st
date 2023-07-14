Class {
	#name : #PolDecorationByTemplateTraitTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#category : #'Polaris-Tests-Project-Decorator'
}

{ #category : #tests }
PolDecorationByTemplateTraitTest >> test_copyTemplateClass_replacingAll_by_with_nil_class [

    self should: [ PolDummyDecorator new copyTemplateClass: nil replacingAll: #() by: #() ] 
         raise: Error
			 withMessageText: 'Cannot use nil as a template class'

]
