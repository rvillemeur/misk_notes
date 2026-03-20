"
I represent the super user, aka god mode, session, everything is granted.
"
Class {
	#name : 'RBACSuperUserSession',
	#superclass : 'RBACSession',
	#category : 'RdvRbacStudy-session',
	#package : 'RdvRbacStudy',
	#tag : 'session'
}

{ #category : 'uncategorized' }
RBACSuperUserSession class >> defaultSession [
	"Answer the default session."

	^self for: (RBACUser atName: self superUserName)
]

{ #category : 'uncategorized' }
RBACSuperUserSession class >> superUserName [
	"Answer the superUser name."
	
	^RBACUser superUserName
]

{ #category : 'uncategorized' }
RBACSuperUserSession >> request: aRBACAction ifGranted: grantBlock ifDenied: denyBlock [

	^grantBlock value
]
