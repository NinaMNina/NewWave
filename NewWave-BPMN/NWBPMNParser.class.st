Class {
	#name : #NWBPMNParser,
	#superclass : #Object,
	#instVars : [
		'path',
		'bpmn',
		'elementsDict'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #accessing }
NWBPMNParser >> bpmn [
	^ bpmn
]

{ #category : #accessing }
NWBPMNParser >> bpmn: anObject [
	bpmn := anObject
]

{ #category : #'as yet unclassified' }
NWBPMNParser >> createFlow: se usingDict: dict [
	self halt.
	^ se
]

{ #category : #'as yet unclassified' }
NWBPMNParser >> createNewProcess [
	|process startEvent|
	self parseBPMN.
	"validate bpmn"
	startEvent := self getBPMNfromStartEvent.
	process := NWProcess id: self getBPMNid name: self getBPMNname initialFlowElement: startEvent.
	^ process
]

{ #category : #accessing }
NWBPMNParser >> elementsDict [
	^ elementsDict 
]

{ #category : #accessing }
NWBPMNParser >> elementsDict: anObject [
	elementsDict := anObject
]

{ #category : #'as yet unclassified' }
NWBPMNParser >> getBPMNfromStartEvent [
	| se ee all dict |
	ee := self parseEndEvent: (self bpmn findElementNamed: 'endEvent').
	dict := Dictionary new.
	all := self bpmn findElementNamed: 'process'.
	all descendantElementsDo: [ :each | 
		(each isNamed: 'startEvent') 
			ifTrue: [ se := (self parseStartEvent: (self bpmn findElementNamed: 'startEvent')).
						dict at: (each attributeAt: 'id') 
								put: se ]
			ifFalse:	[dict at: (each attributeAt: 'id') 
								put: (self parseBPMNNode: each) ]
		].
	self halt.
	^ self createFlow: se usingDict: dict
]

{ #category : #'as yet unclassified' }
NWBPMNParser >> getBPMNid [
	| id |
	id := self bpmn findElementNamed: 'process'.
	^ id attributeAt: 'id'
]

{ #category : #'as yet unclassified' }
NWBPMNParser >> getBPMNname [
	| name |
	name := self bpmn findElementNamed: 'process'.
	^ name attributeAt: 'name'
]

{ #category : #initialization }
NWBPMNParser >> initialize [ 
	super initialize.
	self elementsDict: {
			('endEvent' -> NWBPMNEndEvent new). 
			('sequenceFlow' -> NWBPMNSequenceFlow new). 
			('exclusiveGateway' -> NWBPMNExGateway new) .
			('parallelGateway' -> NWBPMNParGateway new). 
			('task' -> NWBPMNTask new). 
			('userTask' -> NWBPMNUserTask new). 
			('serviceTask' -> NWBPMNServiceTask new). 
			('scriptTask' -> NWBPMNScriptTask new).
			('callActivity' -> NWBPMNCallActivity new). 
			('dataObject' -> NWBPMNDataObject new). 
			('terminateEndEvent' -> NWBPMNTermEndEvent new). 
			('messageStartEvent' -> NWBPMNMessageStartEvent new). 
			('messageEndEvent' -> NWBPMNMessageEndEvent new). } asDictionary 
]

{ #category : #parsing }
NWBPMNParser >> parseBPMN [
	|bpmnText bpmnParsed|
	bpmnText := self readBPMN.
	bpmnParsed := XMLDOMParser parse: bpmnText.
	self bpmn: bpmnParsed 
]

{ #category : #parsing }
NWBPMNParser >> parseBPMNNode: element [
	| node |
	node := self elementsDict at: element name ifAbsent: [^nil].
	^ node createObject: element.
]

{ #category : #parsing }
NWBPMNParser >> parseEndEvent: endEventBPMN [
	| se | 
	se := NWEndEvent new.
	se description: (endEventBPMN attributeAt: 'description');
		id: (endEventBPMN attributeAt: 'id').
	^ se
]

{ #category : #parsing }
NWBPMNParser >> parseStartEvent: startEventBPMN [
	| se | 
	se := NWStartEvent new.
	se description: (startEventBPMN attributeAt: 'description');
		id: (startEventBPMN attributeAt: 'id').
	^ se
]

{ #category : #accessing }
NWBPMNParser >> path [
	^ path
]

{ #category : #accessing }
NWBPMNParser >> path: anObject [
	path := anObject
]

{ #category : #'as yet unclassified' }
NWBPMNParser >> readBPMN [
	^('D:\Users\Nina M\Desktop\example.bpmn' asFileReference)
    readStreamEncoded: 'cp-1250' do: [ :stream |
        stream upToEnd ].
]

{ #category : #removing }
NWBPMNParser >> removeSufficient: all [
	| all1 retAll naziv |
	all isEmpty ifTrue: [ ^ all ].
	all removeAt: 1.
	all1 := OrderedCollection new.
	all do: [ :each | 
				((each isNamed: 'startEvent') or: [ each isNamed: 'endEvent'])
									ifFalse: [all1 add: each]].
	retAll := OrderedCollection new.
	all1 do: [ :each | 
				((each isNamed: 'process') or: [ each isNamed: 'sequenceFlow'])
									ifFalse: [retAll add: each]].
	^ retAll
]
