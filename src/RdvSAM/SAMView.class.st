Class {
	#name : #SAMView,
	#superclass : #BlElement,
	#instVars : [
		'counter',
		'action',
		'state'
	],
	#category : #'RdvSAM-SAM'
}

{ #category : #accessing }
SAMView >> addButton [

<gtExample>
|icon e|
icon := BrGlamorousVectorIcons add asElement.

e := BlElement new
    background: Color white;
    border: (BlBorder paint: Color gray width: 1);
    geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
    padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
    layout: (BlZoomableLayout new addLayout: BlFrameLayout new; defaultScale: 2; animationDuration: 1 second);
    constraintsDo: [ :c |
        c vertical fitContent.
        c horizontal fitContent ];
    addChild: icon;
    yourself.
 ^e
]

{ #category : #accessing }
SAMView >> createUI [
| adder remover |
	adder := self addButton.
	remover := self substractButton.
	self
		layout: BlLinearLayout horizontal;
		size: 200 @ 50;
		background: (Color gray alpha: 0.2);
		addChildren: {adder.
				counter.
				remover}.

	adder when: BlClickEvent do: [ :anEvent | anEvent consumed: true. action increment. ].
	remover when: BlClickEvent do: [ :anEvent | anEvent consumed: true. action decrement. ]
]

{ #category : #accessing }
SAMView >> decrement: aValue [
	self background: (Color red alpha: 0.2).
	counter contentElement: (BlTextElement new text: aValue asRopedText).
]

{ #category : #accessing }
SAMView >> increment: aValue [ 
	self background: (Color green alpha: 0.2).
	counter contentElement: (BlTextElement new text: aValue asRopedText).
]

{ #category : #accessing }
SAMView >> initialize [
super initialize.
	counter := (BlTextElement new text: 0 asRopedText) asScalableElement.
	"those instance can be created elsewhere, what is important is how they are wired up"
	state := SAMState new view: self.
	action := SAMAction new model: (SAMModel new state: state).
]

{ #category : #accessing }
SAMView >> substractButton [ 
<gtExample>
|icon e|
icon := BrGlamorousVectorIcons remove asElement.

e := BlElement new
    background: Color white;
    border: (BlBorder paint: Color gray width: 1);
    geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
    padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
    layout: (BlZoomableLayout new addLayout: BlFrameLayout new; defaultScale: 2; animationDuration: 1 second);
    constraintsDo: [ :c |
        c vertical fitContent.
        c horizontal fitContent ];
    addChild: icon;
    yourself.
 ^e

]
