Class {
	#name : #BaselineOfRdvNote,
	#superclass : #BaselineOf,
	#category : #BaselineOfRdvNote
}

{ #category : #accessing }
BaselineOfRdvNote >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec postLoadDoIt: #loadLepiter.
			spec
				package: 'RdvNote';
				package: 'RdvSAM';
				package: 'RdvRounding' ]
]

{ #category : #accessing }
BaselineOfRdvNote >> loadLepiter [ 
	| dbExist |
	dbExist := false.
	LeDatabasesRegistry defaultLogicalDatabase registeredDBs
		do: [ :e | e uuidString = 'eeyinywcclrst8qypl6okcb2' ifTrue: [ dbExist := true ] ].
	dbExist
		ifFalse: [ LeDatabasesRegistry defaultLogicalDatabase properties
				addRegisteredDirectory: FileLocator imageDirectory
			/ 'pharo-local'
			/ 'iceberg'
			/ 'rvillemeur'
			/ 'misk_notes'
			/ 'lepiter'.
	
	LeDatabasesRegistry default defaultLogicalDatabase reload. ]
]

{ #category : #accessing }
BaselineOfRdvNote >> loadLepiter2 [
	"https://github.com/feenkcom/gt4edx/blob/4d57e4c9993de6e2e22a5d27dd7809f012f67ee1/src/BaselineOfGToolkit4Edx/BaselineOfGToolkit4Edx.class.st#L8"
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory
			/ 'pharo-local'
			/ 'iceberg'
			/ 'feenkcom'
			/ 'gt4edx'
			/ 'lepiter'.
	
	LeDatabasesRegistry default defaultLogicalDatabase reload.
]
