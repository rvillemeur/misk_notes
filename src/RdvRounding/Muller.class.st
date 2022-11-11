"
# Muller's Recurrence - roundoff gone wrong

A while back I came upon a seemingly not-too-difficult programming exercise:

Define a function  
{{gtMethod:Muller>>reccurenceX:y: |expanded=true|label=muller's function}}

and compute it at least 30 time, like this:
{{gtMethod:Muller>>doCalculation|expanded=true|label=muller calculation}}

This isn’t too hard to code up . With normal double-precision floats, the result converges neatly toward **100**. 
Super!
{{gtExample:Muller>>withFloat | noCode= false | previewExpanded= false}}

Unfortunately, 100 is not even close to the right answer. **This recurrence actually converges to 5.**
{{gtExample:Muller>>withFraction | noCode= false |  previewExpanded= false}}



I think many programmers, myself included, do realize that floating point math can go haywire in some situations, but brush it off as something that occurs only when extremely small or extremely large numbers are involved, or when some tremendous number of errors are accumulated.  This exercise, with its innocuous-looking constants and low iteration count, does a nice job demonstrating that roundoff errors can have significant impact even outside of numerical extremes.  In this case, the instability of the fixed point at 5 causes even minor numerical errors to significantly tilt the result.

# source
[source](https://latkin.org/blog/2014/11/22/mullers-recurrence-roundoff-gone-wrong/)
"
Class {
	#name : #Muller,
	#superclass : #Object,
	#instVars : [
		'result',
		'numberOfIteration'
	],
	#category : #RdvRounding
}

{ #category : #accessing }
Muller >> doCalculation [
3 to: self  numberOfIteration do: [ :i | 
    result
        at: i
        put: (self reccurenceX:  (result at: i - 1) y: (result at: i - 2)) ].
]

{ #category : #accessing }
Muller >> initialize [
super initialize.
result := Array new: self  numberOfIteration.
]

{ #category : #accessing }
Muller >> numberOfIteration [
 ^100
]

{ #category : #accessing }
Muller >> reccurenceX: x y: y [
^108 - (815 - (1500 / y) / x)
]

{ #category : #accessing }
Muller >> withFloat [
<gtExample>
result at: 1 put: 4.
result at: 2 put: 4.25.

self doCalculation.

^result collect: [ :each | each asFloat ].

]

{ #category : #accessing }
Muller >> withFraction [
<gtExample>
result at: 1 put: 4.
result at: 2 put: 17/4.

self doCalculation.

^result collect: [ :each | each asFloat ].
]
