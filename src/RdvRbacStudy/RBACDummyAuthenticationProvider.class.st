"
I'm a Dummy authentication provider, anything you request I'll grant.
"
Class {
	#name : 'RBACDummyAuthenticationProvider',
	#superclass : 'RBACAuthenticationProvider',
	#category : 'RdvRbacStudy-authentication',
	#package : 'RdvRbacStudy',
	#tag : 'authentication'
}

{ #category : 'as yet unclassified' }
RBACDummyAuthenticationProvider >> authenticateUsername: userString password: passwordString [

	^true
]

{ #category : 'as yet unclassified' }
RBACDummyAuthenticationProvider >> lastLoginOf: aRBACUser [
	^ Timestamp now
]
