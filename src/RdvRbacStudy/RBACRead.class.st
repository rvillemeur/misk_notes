"
I represent the Read action
"
Class {
	#name : 'RBACRead',
	#superclass : 'RBACAction',
	#category : 'RdvRbacStudy-operation',
	#package : 'RdvRbacStudy',
	#tag : 'operation'
}

{ #category : 'uncategorized' }
RBACRead >> canBeDoneBy: aRBACUser [
	"Answer true if the receiver can be done by aRBACUser."

	^aRBACUser canRead: self role
]
