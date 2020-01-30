Class {
	#name : #NWBPMNEndEvent,
	#superclass : #Object,
	#instVars : [
		'endEvent'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #'as yet unclassified' }
NWBPMNEndEvent >> createObject: element [
	| taskObject |
	taskObject := NWEndEvent new.
	taskObject description: (element attributeAt: 'description' ifAbsent: '' ).
	taskObject id: (element attributeAt: 'id' ifAbsent: '' ).
	^ taskObject
]

{ #category : #accessing }
NWBPMNEndEvent >> endEvent [
	^ endEvent
]

{ #category : #accessing }
NWBPMNEndEvent >> endEvent: anObject [
	endEvent := anObject
]

{ #category : #initialization }
NWBPMNEndEvent >> initialize [ 
	super initialize 
]
