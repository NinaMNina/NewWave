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
	startEvent := self getBPMNstartEvent.
	process := NWProcess id: self getBPMNid name: self getBPMNname initialFlowElement: startEvent.
	^ process
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

{ #category : #'as yet unclassified' }
NWBPMNParser >> getBPMNstartEvent [
	^ self parseStartEvent: (self bpmn allElementsNamed: 'startEvent')
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
NWBPMNParser >> parseStartEvent: startEventBPMN [
	| se | 
	se := NWStartEvent new.
	"se description: startEventBPMN get"
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
