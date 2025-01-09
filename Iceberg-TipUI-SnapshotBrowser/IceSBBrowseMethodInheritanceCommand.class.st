Class {
	#name : 'IceSBBrowseMethodInheritanceCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseMethodInheritanceCommand class >> defaultName [

	^ 'Browse implementors'
]

{ #category : 'testing' }
IceSBBrowseMethodInheritanceCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedClassIsLoaded ]
]

{ #category : 'executing' }
IceSBBrowseMethodInheritanceCommand >> execute [
	"Browse implementors of the selected method"

	self systemNavigation 
		methodHierarchyBrowserForClass: context selectedClassOrMetaClass 
		selector: context selectedMessageName

]
