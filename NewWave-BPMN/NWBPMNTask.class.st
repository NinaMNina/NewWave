Class {
	#name : #NWBPMNTask,
	#superclass : #Object,
	#instVars : [
		'task'
	],
	#category : #'NewWave-BPMN'
}

{ #category : #'as yet unclassified' }
NWBPMNTask >> createNode: element [
	
]

{ #category : #'as yet unclassified' }
NWBPMNTask >> createObject: element [
	| taskObject |
	taskObject := NWBaseTask new.
	taskObject description: (element attributeAt: 'description' ifAbsent: '' ).
	taskObject value: 200.
	^ taskObject
]

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
