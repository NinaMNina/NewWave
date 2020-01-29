Class {
	#name : #NWBPMNTask,
	#superclass : #Object,
	#instVars : [
		'task'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #initialization }
NWBPMNTask >> initialize [ 
	super initialize 
]

{ #category : #accessing }
NWBPMNTask >> task [
	^ task
]

{ #category : #accessing }
NWBPMNTask >> task: anObject [
	task := anObject
]
