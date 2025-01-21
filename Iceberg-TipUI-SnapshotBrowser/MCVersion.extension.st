Extension { #name : 'MCVersion' }

{ #category : '*Iceberg-TipUI-SnapshotBrowser' }
MCVersion >> browse [

	^ (IceSnapshotBrowser forSnapshot: self completeSnapshot) open
]
