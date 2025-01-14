"
I am a common superclass for all the commands of the Snapshot browser. 

Probably we could reuse some of the Iceberg commands instead of those, we should iterate.
"
Class {
	#name : 'IceSnapshotBrowserCommand',
	#superclass : 'CmCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'accessing - selection' }
IceSnapshotBrowserCommand >> selectedClass [

	^ context classSelection
]

{ #category : 'private' }
IceSnapshotBrowserCommand >> selectedClassIsLoaded [
	"Answer <true> if the currently selected class is loaded in the system"

	^ self class environment hasClassNamed: self selectedClass
]

{ #category : 'menu messages' }
IceSnapshotBrowserCommand >> tools [

	^ context application tools
]
