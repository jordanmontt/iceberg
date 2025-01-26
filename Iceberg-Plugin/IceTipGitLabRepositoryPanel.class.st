"
I'm a panel to show and/or manipulate a project definition in a GitLab git repository.
"
Class {
	#name : 'IceTipGitLabRepositoryPanel',
	#superclass : 'IceTipGitProviderRepositoryPanel',
	#category : 'Iceberg-Plugin-Gitlab',
	#package : 'Iceberg-Plugin',
	#tag : 'Gitlab'
}

{ #category : 'accessing' }
IceTipGitLabRepositoryPanel class >> order [

	^ 120
]

{ #category : 'actions' }
IceTipGitLabRepositoryPanel >> configureBuilder: aBuilder [

	aBuilder beGitLab
]

{ #category : 'accessing' }
IceTipGitLabRepositoryPanel >> providerName [

	^ 'GitLab'
]

{ #category : 'initialization' }
IceTipGitLabRepositoryPanel >> windowIcon [

	^ self iconNamed: #gitlab
]

{ #category : 'initialization' }
IceTipGitLabRepositoryPanel >> windowTitle [

	^ 'Clone from gitlab.com'
]
