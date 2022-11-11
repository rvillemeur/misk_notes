Class {
	#name : #SAMModel,
	#superclass : #Object,
	#instVars : [
		'count',
		'state',
		'direction'
	],
	#category : #'RdvSAM-SAM'
}

{ #category : #accessing }
SAMModel >> accept: data [ 
	data = #increment
		ifTrue: [ count := count + 1.
			direction := #up ].
	data = #decrement
		ifTrue: [ count := count - 1.
			direction := #down ].
	state representation: self
]

{ #category : #accessing }
SAMModel >> count [

	^ count
]

{ #category : #accessing }
SAMModel >> count: anObject [

	count := anObject
]

{ #category : #accessing }
SAMModel >> direction [

	^ direction
]

{ #category : #accessing }
SAMModel >> direction: anObject [

	direction := anObject
]

{ #category : #accessing }
SAMModel >> initialize [ 
	count := 0
]

{ #category : #accessing }
SAMModel >> state [

	^ state
]

{ #category : #accessing }
SAMModel >> state: anObject [

	state := anObject
]
