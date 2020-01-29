Class {
	#name : #NWBPMNCallActivity,
	#superclass : #Object,
	#instVars : [
		'activity'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #accessing }
NWBPMNCallActivity >> activity [
	^ activity
]

{ #category : #accessing }
NWBPMNCallActivity >> activity: anObject [
	activity := anObject
]

{ #category : #initialization }
NWBPMNCallActivity >> initialize [ 
	super initialize 
]
