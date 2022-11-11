Class {
	#name : #SAMAction,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'RdvSAM-SAM'
}

{ #category : #accessing }
SAMAction >> decrement [ 
"invoke the present method of the model"
^model accept: #decrement
]

{ #category : #accessing }
SAMAction >> increment [ 
"invoke the present method of the model"
^model accept: #increment
]

{ #category : #accessing }
SAMAction >> model [

	^ model
]

{ #category : #accessing }
SAMAction >> model: anObject [

	model := anObject
]
