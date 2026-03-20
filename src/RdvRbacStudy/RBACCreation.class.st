"
I represent the Creation action
"
Class {
	#name : 'RBACCreation',
	#superclass : 'RBACAction',
	#category : 'RdvRbacStudy-operation',
	#package : 'RdvRbacStudy',
	#tag : 'operation'
}

{ #category : 'uncategorized' }
RBACCreation class >> isValidationActionClass [
	"Answer whether the receiver is a validation action class (used in Validation)"
	
	^true
]

{ #category : 'uncategorized' }
RBACCreation >> canBeDoneBy: aRBACUser [
	^aRBACUser canCreate: self role
]
