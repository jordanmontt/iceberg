Class {
	#name : 'IceSBBrowseMethodSendersCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseMethodSendersCommand class >> defaultName [

	^ 'Browse senders'
]

{ #category : 'executing' }
IceSBBrowseMethodSendersCommand >> execute [
	"Browse senders of the selected method"

	self selectedMethod browseSenders
]
