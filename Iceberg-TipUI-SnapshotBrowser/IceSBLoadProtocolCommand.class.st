Class {
	#name : 'IceSBLoadProtocolCommand',
	#superclass : 'IceSnapshotBrowserCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBLoadProtocolCommand class >> defaultName [

	^ 'Load protocol...'
]

{ #category : 'testing' }
IceSBLoadProtocolCommand >> canBeExecuted [ 

	^ self selectedProtocol notNil
]

{ #category : 'executing' }
IceSBLoadProtocolCommand >> execute [
	"Load the selected protocol"

	self selectedProtocol load
]

{ #category : 'accessing - selection' }
IceSBLoadProtocolCommand >> selectedProtocol [

	^ context protocolSelection 
]
