Class {
	#name : #SAMState,
	#superclass : #Object,
	#instVars : [
		'view'
	],
	#category : #'RdvSAM-SAM'
}

{ #category : #accessing }
SAMState >> representation: aModel [ [
	aModel direction = #up ifTrue: [ view increment: aModel count ].
	aModel direction = #down ifTrue: [ view decrement: aModel count ]
]
]

{ #category : #accessing }
SAMState >> view [

	^ view
]

{ #category : #accessing }
SAMState >> view: anObject [

	view := anObject
]
