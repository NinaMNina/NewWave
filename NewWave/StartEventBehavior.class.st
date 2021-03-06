"
I am a class that starts the execution. When the new announcment is sent execution will be started.
"
Class {
	#name : #StartEventBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #'as yet unclassified' }
StartEventBehavior >> performExecution: elemToExecute executor: wave [
	wave waveAnnouncer
		when: StartAnnouncer
		do: [ | worker |
			worker := TKTWorker new.
			worker start.
			('Starting worker on process '
				, Processor activeProcess identityHash asString) traceCr.
			('Worker process is ' , worker process identityHash asString)
				traceCr.
			wave workers at: worker name put: worker.
			wave flowHandler workerid: worker name.
			wave tryToExecuteNext: elemToExecute ]
]
