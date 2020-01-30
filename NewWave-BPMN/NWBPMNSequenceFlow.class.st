Class {
	#name : #NWBPMNSequenceFlow,
	#superclass : #Object,
	#instVars : [
		'sourceRef',
		'targetRef'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #'as yet unclassified' }
NWBPMNSequenceFlow >> createObject: element [
	self sourceRef: (element attributeAt: 'sourceRef').
	self targetRef: (element attributeAt: 'targetRef').
	^ self
]

{ #category : #initialization }
NWBPMNSequenceFlow >> initialize [ 	
	super initialize 
]

{ #category : #accessing }
NWBPMNSequenceFlow >> sourceRef [
	^ sourceRef
]

{ #category : #accessing }
NWBPMNSequenceFlow >> sourceRef: anObject [
	sourceRef := anObject
]

{ #category : #accessing }
NWBPMNSequenceFlow >> targetRef [
	^ targetRef
]

{ #category : #accessing }
NWBPMNSequenceFlow >> targetRef: anObject [
	targetRef := anObject
]
