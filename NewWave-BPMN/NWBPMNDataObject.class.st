Class {
	#name : #NWBPMNDataObject,
	#superclass : #Object,
	#instVars : [
		'dataObject'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #'as yet unclassified' }
NWBPMNDataObject >> createObject: element [
	| objData |
	objData := NWDataObject new.
	objData id: (element attributeAt: 'id').
	objData name: (element attributeAt: 'name').
	^ objData
]

{ #category : #accessing }
NWBPMNDataObject >> dataObject [
	^ dataObject
]

{ #category : #accessing }
NWBPMNDataObject >> dataObject: anObject [
	dataObject := anObject
]

{ #category : #initialization }
NWBPMNDataObject >> initialize [
	super initialize
]
