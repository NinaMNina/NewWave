Class {
	#name : #NWBPMNMessageEvent,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #initialization }
NWBPMNMessageEvent >> initialize [ 
	super initialize
]

{ #category : #accessing }
NWBPMNMessageEvent >> message [
	^ message
]

{ #category : #accessing }
NWBPMNMessageEvent >> message: anObject [
	message := anObject
]
