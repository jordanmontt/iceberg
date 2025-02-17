"
I'm a panel to show and/or manipulate a project definition in a BitBucket git repository.
"
Class {
	#name : 'IceTipBitbucketRepositoryPanel',
	#superclass : 'IceTipGitProviderRepositoryPanel',
	#category : 'Iceberg-Plugin-Bitbucket',
	#package : 'Iceberg-Plugin',
	#tag : 'Bitbucket'
}

{ #category : 'accessing' }
IceTipBitbucketRepositoryPanel class >> order [

	^ 110
]

{ #category : 'actions' }
IceTipBitbucketRepositoryPanel >> configureBuilder: aBuilder [

	aBuilder beBitbucket
]

{ #category : 'accessing' }
IceTipBitbucketRepositoryPanel >> providerName [

	^ 'Bitbucket'
]

{ #category : 'initialization' }
IceTipBitbucketRepositoryPanel >> windowIcon [

	^ self iconNamed: #bitbucket
]

{ #category : 'initialization' }
IceTipBitbucketRepositoryPanel >> windowTitle [

	^ 'Clone from bitbucket.org'
]
