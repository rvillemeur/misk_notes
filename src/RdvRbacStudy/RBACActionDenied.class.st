Class {
	#name : 'RBACActionDenied',
	#superclass : 'RBACException',
	#instVars : [
		'user'
	],
	#category : 'RdvRbacStudy-exception',
	#package : 'RdvRbacStudy',
	#tag : 'exception'
}

{ #category : 'uncategorized' }
RBACActionDenied class >> denialErrorText [
	"Answer the description text for these exceptions."
	^ 'You are not authorized for doing this operation.'
]

{ #category : 'instance creation' }
RBACActionDenied class >> signalForUser: aRBACUser [ 
	
	^self new 
		user: aRBACUser;
		signal
]

{ #category : 'accessing' }
RBACActionDenied >> user: aRBACUser [
	user := aRBACUser
]
