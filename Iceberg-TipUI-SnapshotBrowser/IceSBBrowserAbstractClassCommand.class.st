"
I am an abstract class to manage the snapshot browser commands about classes.
"
Class {
	#name : 'IceSBBrowserAbstractClassCommand',
	#superclass : 'IceSnapshotBrowserCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'testing' }
IceSBBrowserAbstractClassCommand >> canBeExecuted [ 

	^ self selectedClass notNil
]
