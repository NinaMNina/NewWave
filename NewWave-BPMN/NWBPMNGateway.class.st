Class {
	#name : #NWBPMNGateway,
	#superclass : #Object,
	#instVars : [
		'gateway'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #accessing }
NWBPMNGateway >> gateway [
	^ gateway
]

{ #category : #accessing }
NWBPMNGateway >> gateway: anObject [
	gateway := anObject
]
