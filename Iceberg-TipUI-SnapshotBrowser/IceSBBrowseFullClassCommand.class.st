Class {
	#name : 'IceSBBrowseFullClassCommand',
	#superclass : 'IceSBBrowserAbstractClassCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseFullClassCommand class >> defaultName [

	^ 'Browse full'
]

{ #category : 'testing' }
IceSBBrowseFullClassCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedClassIsLoaded ]
]

{ #category : 'executing' }
IceSBBrowseFullClassCommand >> execute [
	"Browse the selected class"

	(self class environment at: self selectedClass) browse
]
