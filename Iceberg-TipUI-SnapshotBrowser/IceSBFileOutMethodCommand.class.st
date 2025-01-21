"
I am a command to file out a method in the snapshot browser.
"
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
