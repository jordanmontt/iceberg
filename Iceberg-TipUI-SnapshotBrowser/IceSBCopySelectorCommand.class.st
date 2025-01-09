Class {
	#name : 'IceSBCopySelectorCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBCopySelectorCommand class >> defaultName [

	^ 'Copy selector'
]

{ #category : 'executing' }
IceSBCopySelectorCommand >> execute [
	"Browse the selected method"

	Clipboard 
		clipboardText: self selectedMethod selector 
		informing: ('Selector {1} copied to clipboard' format: { self selectedMethod selector })
]
