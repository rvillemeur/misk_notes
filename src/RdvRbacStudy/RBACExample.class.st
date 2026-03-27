Class {
	#name : 'RBACExample',
	#superclass : 'Object',
	#category : 'RdvRbacStudy-examples',
	#package : 'RdvRbacStudy',
	#tag : 'examples'
}

{ #category : 'as yet unclassified' }
RBACExample >> createOperations [
<gtExample>
^RBACOperation new.
]

{ #category : 'as yet unclassified' }
RBACExample >> createRole [
<gtExample>
^RBACRole new.
]

{ #category : 'as yet unclassified' }
RBACExample >> createUser [
<gtExample>

^RBACUser new.
]

{ #category : 'as yet unclassified' }
RBACExample >> emptyRBAC [
<gtExample>
	| profile crudForCreateAndUpdate crudForDeleteAndRead sysop objectForCreate  objectForDelete role operations  |

	profile := self createUser.
	role := self createRole.
	operations := self createOperations.
	profile addRole: role.
	
	objectForCreate := RBACNamedModel new.
	crudForCreateAndUpdate := RBACPermission target: objectForCreate.
	crudForCreateAndUpdate allowsCreation: true; allowsUpdate: true.
		
	objectForDelete := RBACNamedModel new.
	crudForDeleteAndRead := RBACPermission target: objectForDelete.
	crudForDeleteAndRead allowsDeletion: true; allowsRead: true.
		
	sysop := RBACPermission role: role target: operations.
		
	role
		addPermission: crudForCreateAndUpdate;
		addPermission: crudForDeleteAndRead;
		addPermission: sysop.
		
^ role.
]
