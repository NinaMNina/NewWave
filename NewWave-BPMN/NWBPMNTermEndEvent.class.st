Class {
	#name : #NWBPMNTermEndEvent,
	#superclass : #Object,
	#instVars : [
		'terminateEndEvent'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #initialization }
NWBPMNTermEndEvent >> initialize [ 
	super initialize 
]

{ #category : #accessing }
NWBPMNTermEndEvent >> terminateEndEvent [
	^ terminateEndEvent
]

{ #category : #accessing }
NWBPMNTermEndEvent >> terminateEndEvent: anObject [
	terminateEndEvent := anObject
]
