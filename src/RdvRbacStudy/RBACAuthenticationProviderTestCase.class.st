Class {
	#name : 'RBACAuthenticationProviderTestCase',
	#superclass : 'RBACTest',
	#category : 'RdvRbacStudy-tests',
	#package : 'RdvRbacStudy',
	#tag : 'tests'
}

{ #category : 'uncategorized' }
RBACAuthenticationProviderTestCase >> authenticationProvider [

	^RBACAuthenticationProvider dummy
]

{ #category : 'uncategorized' }
RBACAuthenticationProviderTestCase >> testDummyAuthentication [
	self
		assert:
			(self authenticationProvider
				authenticateUsername: 'foo'
				password: 'baz')
]

{ #category : 'uncategorized' }
RBACAuthenticationProviderTestCase >> testReturnACorrectRBACSession [
	self assert: (RBACAuthenticationProvider new sessionFor: RBACUser new) class = RBACSession.
	self
		assert: (RBACAuthenticationProvider new sessionFor: (RBACUser new isSuperuser: true)) class = RBACSession.
	self
		assert:
			(RBACAuthenticationProvider new
				sessionFor: (RBACUser new name: RBACSuperUserSession superUserName)) class
				= RBACSuperUserSession
]
