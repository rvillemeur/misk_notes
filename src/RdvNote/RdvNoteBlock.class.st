"
Bloc:

Root: BlElement

Defines
	- geometry and bounds (BlBounds)
	- size

	- background (BlBackground). Paints (BlPaint) are used for background, border, text fill or stroke.
	- border (BlBorder)
	- opacity

	- layout and children composition. (BlLayout, BlChildren, and their children)
	
	- event handling (BlEvent and children)


You can add element with addChild:, and the will be disposed according the 
the layout specified.

UI element model can use Announcer (observer) pattern to tell when their state
change:
	card announcer when: CardFlipped send: #onFlipped to: self.
	card announcer when: CardDisappeared send: #onDisappear to: self.

Drawing is done through method 'drawOnSpartaCanvas', which receive a sparta
(vector) canvas as an argument.

To add event to an element, you first need to subclass 'BlEventListener' and
override the event you want to manage. You then add your event handler to your
bloc element with method 'addEventHandler'. Event are bloc announcement method 
and classes.

You can apply transformation to a BlElement:
* rotation
* translation
* Scaling
* reflection
* etc...

BlSpace is a window in bloc, equivalent of the world in Pharo ??? 
BlElement are added or removed from a BlSpace, which act as a scene graph. 
Spaces are managed through BlUniverse.

We so have
BlUniverse -> BlSpace -> BlElement
					  -> BlEvent and BlBaseEventProcessor
					  -> BlCursor
					  -> BlTime
					  -> BlSpaceFrame
					  
Last, Bloc run on a host, being:
- Morphic
- OsWindow
- SDL2.
"
Class {
	#name : #RdvNoteBlock,
	#superclass : #Object,
	#category : #RdvNote
}

{ #category : #accessing }
RdvNoteBlock >> animatedIcon [
<gtExample>
|icon e|
icon := BrGlamorousVectorIcons transcript asElement.
icon constraintsDo: [ :c | c accountTransformation ].

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
RdvNoteBlock >> animtedBackground [
<gtExample>
|element animation|
	
	element := BlElement new.
element size: 50@50.

animation := BlNumberTransition new
    from: 0;
    to: 1;
    by: 0.5;
    beInfinite;
    duration: 3 seconds;
    onStepDo: [ :aValue :anElement |
        aValue < 0.5
            ifTrue: [ anElement background: Color red ]
            ifFalse: [ anElement background: Color blue ] ].

element addAnimation: animation.
^element
]

{ #category : #accessing }
RdvNoteBlock >> baseStar [
<gtExample>
	"This is a new method"
|element|
element := BlDevElement new size:200@200;
geometry:( BlPolygon
		vertices:
			{(100 @ 50).
			(115 @ 90).
			(150 @ 90).
			(125 @ 110).
			(135 @ 150).
			(100 @ 130).
			(65 @ 150).
			(75 @ 110).
			(50 @ 90).
			(85 @ 90)});
background: (Color pink alpha:0.2);
border: (BlBorder paint: Color orange width: 4).

element when: BlMouseEnterEvent do: [ :anEvent |
		anEvent consumed: true.
		element background: (Color red alpha:0.2) ].
		
 element when: BlMouseLeaveEvent do: [ :anEvent |
		anEvent consumed: true.
		element background: (Color blue alpha:0.2) ].
^element
]

{ #category : #accessing }
RdvNoteBlock >> bigAdaptableText [
<gtExample>
^(BlTextElement new text: 'hello' asRopedText) asScalableElement.
]

{ #category : #accessing }
RdvNoteBlock >> createSpace [
	"This is a new method"
<gtExample>	
	| aSpace |
	
	aSpace := BlSpace new
		addChild: self helloWorldScene;
		extent: 800@600;
		title: 'Hello World'.

	^ aSpace show
]

{ #category : #accessing }
RdvNoteBlock >> eventExample [
<gtExample>
	"This is a new method"
|toto|
toto := BlDevElement new size:200@200;
geometry:( BlPolygon
		vertices:
			{(100 @ 50).
			(115 @ 90).
			(150 @ 90).
			(125 @ 110).
			(135 @ 150).
			(100 @ 130).
			(65 @ 150).
			(75 @ 110).
			(50 @ 90).
			(85 @ 90)});
background: (Color pink alpha:0.2);
border: (BlBorder paint: Color orange width: 4);
"layout: BlLinearLayout horizontal alignCenter;"
"constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
outskirts: BlOutskirts outside.

toto when: BlMouseEnterEvent do: [ :anEvent |
		anEvent consumed: true.
		toto background: (Color red alpha:0.2) ].
		
 toto when: BlMouseLeaveEvent do: [ :anEvent |
		anEvent consumed: true.
		toto background: (Color blue alpha:0.2) ].
^toto
]

{ #category : #accessing }
RdvNoteBlock >> eventStyleExample [
<gtExample>
|toto|
toto := BlElement new size: 200 @ 200.
toto styles
	default: [ :aStyle | 
		aStyle
			geometry: (BlPolygon
					vertices: {100 @ 50.
							115 @ 90.
							150 @ 90.
							125 @ 110.
							135 @ 150.
							100 @ 130.
							65 @ 150.
							75 @ 110.
							50 @ 90.
							85 @ 90});
			background: (Color pink alpha: 0.2);
			border: (BlBorder paint: Color black width: 1) ];
		hovered:[ :aStyle | aStyle
			background: (Color blue alpha: 0.2);
			border: (BlBorder paint: Color purple width: 1) ].
			
^toto
]

{ #category : #accessing }
RdvNoteBlock >> exampleOutSkirtsCentered [
<gtExample>
	| element |
	element := self baseStar.
	element outskirts: BlOutskirts centered.
	^ element
]

{ #category : #accessing }
RdvNoteBlock >> exampleOutSkirtsInside [
<gtExample>
	| element |
	element := self baseStar.
	element outskirts: BlOutskirts inside.
	^ element
]

{ #category : #accessing }
RdvNoteBlock >> exampleOutSkirtsOutside [
<gtExample>
	| element |
	element := self baseStar.
	element outskirts: BlOutskirts outside.
	^ element
]

{ #category : #accessing }
RdvNoteBlock >> helloWorldScene [
	<gtExample>
	| aContainer |
	
	aContainer := BrVerticalPane new
		matchParent;
		alignCenter.
		
	aContainer addChild: (BrLabel new
		aptitude: (BrGlamorousLabelAptitude new fontSize: 30);
		text: 'Hello world!').
		
	^ aContainer
]

{ #category : #accessing }
RdvNoteBlock >> iconScaleToFitElement [
<gtExample>
|icon scaledIcon e|
icon := BrGlamorousVectorIcons transcript asElement.
scaledIcon := icon asScalableElement
    scaleStrategy: (BlScalableFixedStrategy zoom: 2);
    constraintsDo: [ :c |
        c horizontal fitContent.
        c vertical fitContent ].
    
e := BlElement new
    background: Color white;
    border: (BlBorder paint: Color gray width: 1);
    geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
    padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
    layout: BlFrameLayout new;
    constraintsDo: [ :c |
        c vertical fitContent.
        c horizontal fitContent ];
    addChild: scaledIcon;
    yourself.
    
^e
]

{ #category : #accessing }
RdvNoteBlock >> squareSurroundedByNumbers [
<gtExample>
^BlElement new
    layout: (BlGridLayout horizontal columnCount: 3);
    constraintsDo: [ :c |
        c horizontal matchParent.
        c vertical matchParent ];
    addChildren: {
        "top row"
        (BlTextElement new text: '5,0' asRopedText).
        (BlElement new size: 0@0).
        (BlTextElement new text: '13,0' asRopedText).
        
        "middle row"
        (BlElement new size: 0@0).
        (BlElement new
            constraintsDo: [ :c |
                c horizontal matchParent.
                c vertical matchParent ];
            border: (BlBorder paint: Color gray width: 1)).
        (BlElement new size: 0@0).
        
        "bottom row"
        (BlTextElement new text: '5,25' asRopedText).
        (BlElement new size: 0@0).
        (BlTextElement new text: '13,25' asRopedText). }.
   
]
