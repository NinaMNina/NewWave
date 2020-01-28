Class {
	#name : #NWBPMNParser,
	#superclass : #Object,
	#instVars : [
		'path',
		'bpmn'
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
NWBPMNParser >> createNewProcess [
	|process startEvent|
	self parseBPMN.
	"validate bpmn"
	startEvent := self getBPMNfromStartEvent.
	process := NWProcess id: self getBPMNid name: self getBPMNname initialFlowElement: startEvent.
	^ process
]

{ #category : #'as yet unclassified' }
NWBPMNParser >> getBPMNfromStartEvent [
	| se ee all dict|
	se := self parseStartEvent: (self bpmn findElementNamed: 'startEvent').
	ee := self parseEndEvent: (self bpmn findElementNamed: 'endEvent').
	all := self bpmn findElementNamed: 'process'.
	all := all allElements asOrderedCollection.
	dict := Dictionary new.
	dict at: ee id put: ee.
	dict at: se id put: se.
	self halt.
	all do: [ :node |  
		((node isNamed: 'startEvent') or: [node isNamed: 'endEvent']) ifFalse:
			[dict at: (node attributeAt: 'id') put: (self parseBPMNNode: node)]
		].
	^ se
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
	super initialize 
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
