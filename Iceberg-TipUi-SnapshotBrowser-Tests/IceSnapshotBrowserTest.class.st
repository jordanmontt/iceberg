Class {
	#name : 'IceSnapshotBrowserTest',
	#superclass : 'MCTestCase',
	#instVars : [
		'model'
	],
	#category : 'Iceberg-TipUi-SnapshotBrowser-Tests',
	#package : 'Iceberg-TipUi-SnapshotBrowser-Tests'
}

{ #category : 'private' }
IceSnapshotBrowserTest >> allCategories [
	^ Array with: model extensionsCategory with: self mockCategoryName.
]

{ #category : 'private' }
IceSnapshotBrowserTest >> allMethods [
	^ MCSnapshotResource current definitions
		select: [:def | def isMethodDefinition]
		thenCollect: [:def | def selector]		
]

{ #category : 'private' }
IceSnapshotBrowserTest >> allProtocols [
	^ MCSnapshotResource current definitions
		select: [:def | def isMethodDefinition]
		thenCollect: [:def | def category]		
]

{ #category : 'asserting' }
IceSnapshotBrowserTest >> assertAListMatches: strings [

	| lists |
	lists := self presenterLists collect: #items.
	lists
		detect: [ :list | list size = strings size and: [ list includesAll: strings ] ]
		ifNone: [ self fail: 'Could not find all "' , strings asArray asString , '" ' , 'in any of "' , (lists collect: #asArray) asArray asString , '"' ]
]

{ #category : 'asserting' }
IceSnapshotBrowserTest >> assertButtonOn: aString [
	self assert: (self findButtonWithLabel: aString) getModelState.
	
]

{ #category : 'asserting' }
IceSnapshotBrowserTest >> assertTextIs: aString [

	self 
		assert: self methodPresenter text 
		equals: aString
]

{ #category : 'private' }
IceSnapshotBrowserTest >> bottomLayout [
	
	^ model layout children second
]

{ #category : 'private' }
IceSnapshotBrowserTest >> classABooleanMethods [
	^ #(falsehood moreTruth truth)
]

{ #category : 'private' }
IceSnapshotBrowserTest >> classAClassProtocols [

	^ self mockClassA class protocolNames
]

{ #category : 'private' }
IceSnapshotBrowserTest >> classAComment [
	^ self mockClassA comment.
]

{ #category : 'private' }
IceSnapshotBrowserTest >> classADefinitionString [

	^ self mockClassA oldDefinition
]

{ #category : 'private' }
IceSnapshotBrowserTest >> classAProtocols [
	^ self mockClassA protocolNames
]

{ #category : 'private' }
IceSnapshotBrowserTest >> classAclassDefinitionString [

	^ (ClassDefinitionPrinter oldPharo for: self mockClassA class) definitionString
]

{ #category : 'accessing - presenters' }
IceSnapshotBrowserTest >> classDefinitionPresenter [

	^ self codePresenters first
]

{ #category : 'simulating' }
IceSnapshotBrowserTest >> clickOnButton: aString [
	(self findButtonWithLabel: aString) click.
]

{ #category : 'simulating' }
IceSnapshotBrowserTest >> clickOnListItem: aString [
	| list |
	list := self findListContaining: aString.
	list listPresenter clickAtIndex: (list listPresenter items indexOf: aString).
]

{ #category : 'accessing - presenters' }
IceSnapshotBrowserTest >> codePresenters [

	^ self bottomLayout allPresenters 
		select: [ : p | p isKindOf: SpCodePresenter ]
]

{ #category : 'accessing - presenters' }
IceSnapshotBrowserTest >> commentPresenter [

	^ self textPresenters anyOne
]

{ #category : 'private' }
IceSnapshotBrowserTest >> definedClasses [
	^ MCSnapshotResource current definitions 
		select: [:def | def isClassDefinition] 
		thenCollect: [:def | def className].
]

{ #category : 'asserting' }
IceSnapshotBrowserTest >> denyAListHasSelection: aString [
	| found |
	found := true.
	self presenterLists
			detect: [:m | m selectedItem = aString]
			ifNone: [found := false].
	self deny: found.
]

{ #category : 'asserting' }
IceSnapshotBrowserTest >> denyAListIncludesAnyOf: anArrayOfStrings [
	| found |
	found := true.
	self presenterLists 
			detect: [:m | m items includesAnyOf: anArrayOfStrings]
			ifNone: [found := false].
	self deny: found.
]

{ #category : 'asserting' }
IceSnapshotBrowserTest >> denyButtonOn: aString [
	self deny: (self findButtonWithLabel: aString) getModelState.
	
]

{ #category : 'private' }
IceSnapshotBrowserTest >> falsehoodMethodSource [
	^ 'falsehood
	^ false'
]

{ #category : 'accessing - presenters' }
IceSnapshotBrowserTest >> findButtonWithLabel: aString [ 

	^ model allPresenters 
		detect: [ : p | p isKindOf: SpCheckBoxPresenter ]
		ifNone: [ nil ]
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> findListContaining: aString [

	^ self presenterLists detect: [: m | m items includes: aString ]
]

{ #category : 'accessing - presenters' }
IceSnapshotBrowserTest >> methodPresenter [
	"For now we cannot properly distinguish between method and class definition code presenters"

	^ self codePresenters last
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> presenterListChildren [

	^ self upperLayout allPresenters
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> presenterLists [

	^ self presenterListChildren select: [ : p | p isKindOf: SpFilteringListPresenter ]
]

{ #category : 'selecting' }
IceSnapshotBrowserTest >> selectMockClassA [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	
]

{ #category : 'running' }
IceSnapshotBrowserTest >> setUp [
	super setUp.
	model := IceSnapshotBrowser forSnapshot: MCSnapshotResource current snapshot.

]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testCategorySelected [
	self clickOnListItem: self mockCategoryName.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self denyAListIncludesAnyOf: self allProtocols.
	self denyAListIncludesAnyOf: self allMethods.
	self assertTextIs: ''.
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testClassSelected [
	self selectMockClassA.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAProtocols.
	self denyAListIncludesAnyOf: self allMethods.
	self 
		assert: self classDefinitionPresenter text 
		equals: self classADefinitionString.
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testClassSideClassSelected [

	self selectMockClassA.
	self clickOnButton: 'Class'.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAClassProtocols.
	self denyAListIncludesAnyOf: self allMethods.
	self 
		assert: self classDefinitionPresenter text 
		equals: self classAclassDefinitionString.
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testComment [

	self 
		assert: self commentPresenter text 
		equals: String empty.
	
	self clickOnListItem: self mockCategoryName.
	self 
		assert: self commentPresenter text 
		equals: String empty.
	
	self clickOnListItem: 'MCMockClassA'.
	self 
		assert: self commentPresenter text 
		equals: self classAComment.
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testFourColumns [

	self assert: self presenterLists size equals: 4
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testMethodIsCleared [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	self clickOnListItem: 'boolean'.
	self clickOnListItem: 'falsehood'.
	self clickOnListItem: 'numeric'.
	
	self denyAListHasSelection: 'falsehood'.
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testMethodSelected [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	self clickOnListItem: 'boolean'.
	self clickOnListItem: 'falsehood'.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAProtocols.
	self assertAListMatches: self classABooleanMethods.
	self assertTextIs: self falsehoodMethodSource.
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testNoSelection [

	self assertAListMatches: self allCategories.
	self denyAListIncludesAnyOf: self definedClasses.
	self denyAListIncludesAnyOf: self allProtocols.
	self denyAListIncludesAnyOf: self allMethods.

]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testProtocolIsCleared [

	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockASubclass'.
	self clickOnListItem: Protocol unclassified.
	self clickOnListItem: 'MCMockClassA'.

	self denyAListHasSelection: Protocol unclassified
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testProtocolSelected [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	self clickOnListItem: 'boolean'.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAProtocols.
	self assertAListMatches: self classABooleanMethods.
	self assertTextIs: ''.		
]

{ #category : 'testing' }
IceSnapshotBrowserTest >> testSwitchClassButton [

	self deny: (self findButtonWithLabel: 'Class') isNil.
]

{ #category : 'accessing - presenters' }
IceSnapshotBrowserTest >> textPresenters [

	^ self bottomLayout allPresenters 
		select: [ : p | p class = SpTextPresenter ]
]

{ #category : 'private' }
IceSnapshotBrowserTest >> upperLayout [
	
	^ model layout children first
]
