Class {
	#name : #NWBPMNDataObject,
	#superclass : #Object,
	#instVars : [
		'dataObject'
	],
	#category : #'NewWave-BPMN'
}

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
