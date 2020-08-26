nextElementaryLargeIntegerBase: aRadix
	"Form an unsigned integer with incoming digits from sourceStream.
	Return this integer, or zero if no digits found.
	Stop reading if end of digits or if a LargeInteger is formed.
	Count the number of digits and the position of lastNonZero digit and store them in instVar."

	| value digit char |
	value := 0.
	nDigits := 0.
	lastNonZero := 0.
	[ value isLarge
		or: [ char := sourceStream next.
				(char = $_) ifTrue: [ char := sourceStream next ]. "this small change here will allow number to be represented as 1_000_000"
			 char isNil
				or: [ digit := char digitValue.
					(0 > digit or: [ digit >= aRadix ])
						and: [ sourceStream skip: -1.
							true ] ] ] ]
		whileFalse: [ nDigits := nDigits + 1.
			0 = digit
				ifFalse: [ lastNonZero := nDigits ].
			value := value * aRadix + digit ].
	^ value
