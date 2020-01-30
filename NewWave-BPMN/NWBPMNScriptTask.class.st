Class {
	#name : #NWBPMNScriptTask,
	#superclass : #NWBPMNTask,
	#category : #'NewWave-BPMN'
}

{ #category : #'as yet unclassified' }
NWBPMNScriptTask >> createObject: element [
	| taskObject |
	taskObject := NWScriptTask new.
	taskObject id: (element attributeAt: 'id').
	taskObject name: (element attributeAt: 'name').
	taskObject script: (element findElementNamed: 'script').
	^ taskObject 
	
	
]

{ #category : #initialization }
NWBPMNScriptTask >> initialize [ 	
	super initialize 
]
