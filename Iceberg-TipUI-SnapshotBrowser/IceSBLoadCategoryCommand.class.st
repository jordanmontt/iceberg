Class {
	#name : 'IceSBLoadCategoryCommand',
	#superclass : 'IceSnapshotBrowserCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBLoadCategoryCommand class >> defaultName [

	^ 'Load category...'
]

{ #category : 'testing' }
IceSBLoadCategoryCommand >> canBeExecuted [ 

	^ self categorySelection notNil
]

{ #category : 'executing' }
IceSBLoadCategoryCommand >> categorySelection [

	^ context categorySelection
]

{ #category : 'executing' }
IceSBLoadCategoryCommand >> execute [
	"Load the entire selected category"

	self methodsForSelectedClassCategory 
		do: [ :m | m load ]
		displayingProgress: 'Loading definitions...'
]

{ #category : 'executing' }
IceSBLoadCategoryCommand >> methodsForSelectedClassCategory [

	^ context methodsForSelectedClassCategory 
]
