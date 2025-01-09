Class {
	#name : 'IceSBFileOutMethodCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBFileOutMethodCommand class >> defaultName [

	^ 'File out'
]

{ #category : 'executing' }
IceSBFileOutMethodCommand >> execute [
	"File out the selected method"

	context fileOutMessage
]
