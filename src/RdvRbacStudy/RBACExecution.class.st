"
I represent the Exection action
"
Class {
	#name : 'RBACExecution',
	#superclass : 'RBACAction',
	#category : 'RdvRbacStudy-operation',
	#package : 'RdvRbacStudy',
	#tag : 'operation'
}

{ #category : 'uncategorized' }
RBACExecution >> canBeDoneBy: aRBACUser [
	^ aRBACUser canExecute: self role
]
