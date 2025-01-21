"
I am a command to browse the hierarchy of a class.
"
Class {
	#name : 'IceSBBrowseHierarchyClassCommand',
	#superclass : 'IceSBBrowserAbstractClassCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseHierarchyClassCommand class >> defaultName [

	^ 'Browse hierarchy'
]

{ #category : 'testing' }
IceSBBrowseHierarchyClassCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self class environment hasClassNamed: self selectedClass ]
]

{ #category : 'executing' }
IceSBBrowseHierarchyClassCommand >> execute [
	"Browse the selected class"

	(self class environment at: self selectedClass) browseHierarchy
]
