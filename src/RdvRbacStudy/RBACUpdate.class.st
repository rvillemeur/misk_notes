"
I represent the Update action
"
Class {
	#name : 'RBACUpdate',
	#superclass : 'RBACAction',
	#category : 'RdvRbacStudy-operation',
	#package : 'RdvRbacStudy',
	#tag : 'operation'
}

{ #category : 'uncategorized' }
RBACUpdate >> canBeDoneBy: aRBACUser [
	"Answer true if the receiver can be done by aRBACUser."

	^aRBACUser canUpdate: self role
]
