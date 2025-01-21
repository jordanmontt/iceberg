"
I am a command to see different versions of a method
"
Class {
	#name : 'IceSBBrowseMethodVersionsCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseMethodVersionsCommand class >> defaultName [

	^ 'Versions'
]

{ #category : 'testing' }
IceSBBrowseMethodVersionsCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedClassIsLoaded ]
]

{ #category : 'executing' }
IceSBBrowseMethodVersionsCommand >> execute [
	"Browse versions of the selected method"

	self tools versionBrowser
		browseVersionsForClass: context selectedClassOrMetaClass 
		selector: context selectedMessageName
]
