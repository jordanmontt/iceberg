Class {
	#name : 'IceSBBrowseFullMethodCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseFullMethodCommand class >> defaultName [

	^ 'Browse full'
]

{ #category : 'testing' }
IceSBBrowseFullMethodCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedClassIsLoaded ]
]

{ #category : 'executing' }
IceSBBrowseFullMethodCommand >> execute [
	"Browse the selected method"

	self selectedMethod browse
]
