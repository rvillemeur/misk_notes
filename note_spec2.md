# Note on spec2

## architecture
Spec2 is an MVP framework (Model-View-Presenter)

1. The model represent the domain logic of the application
2. The presenter let the developer do the UI programmaticaly
3. The UI is then managed by Pharo.

https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter

```
+-----------------------------------------------+
| passive view (backend morphic, gtk)           | Managed by Pharo through Spec
| your code shouldn't directly interact with it |
+-----------------------------------------------+
                        |
+-----------------------------------------------+
| presenter (your pharo spec code)              | You're responsible of this part
| Subclass of SpPresenter                       |
+-----------------------------------------------+
                        |
+-----------------------------------------------+
| model (your application logic)                | You're responsible of this part
+-----------------------------------------------+
```

### How to find the relationship between Morphic and Spec component
Each component is a presenter, which basic class is 'SpPresenter'
The list of widget available are available in the package 'Spec2-Core-Widgets'
and its sub-package. Their morphic counterpart are in the package 
'Spec2-Adapters-Morphic-Backend'

Ex: for a button. 
```smalltalk
SpButtonPresenter class >> adapterName
^ #ButtonAdapter
```
	
```smalltalk
SpAbstractWidgetPresenter class >> defaultSpec
<spec: #default>
^ SpAbstractWidgetLayout for: self adapterName
```

```smalltalk
SpAdapterBindings subclass: #SpMorphicAdapterBindings	
SpMorphicAdapterBindings >> abstractAdapterClass
	^ SpAbstractMorphicAdapter
```

To link the name:
```smalltalk
 SpAbstractMorphicAdapter  class >> adaptingName
	^ (self name withoutPrefix: 'SpMorphic') asSymbol
```

### SpApplication & SpNotification
SpApplication concentrate ressource for user application like
* which backend to use (Gtk, default is Morphic)



### SpPresenter
Your presenter should be a subclass of SpPresenter
SpPresenter subclass: #MyApplicationUI
It must implement:
- initializePresenters => declare the list of widget that compose the GUI

It shoud implement:
- connectPresenters => declare the interaction between the widget
- initializeWindow: for classic windows (method found in SpWindowPresenter)
- initializeDialogWindow: for dialog and modal windows (method found in 
SpDialogWindowPresenter and SpModalWindowPresenter)
=> those method set the title, size, about box, etc... of the window of the UI.

## Layout

### BoxLayout (SpBoxLayout and SpBoxConstraints)
It show presenters in an ordered box. Box can be horizontal or vertical and 
presenters will be ordered top to down or left to right following direction decided. 
The basic message to add presenters is: #add:expand:fill:padding:
expand 		- true if the new child is to be given extra space allocated to box . 
			  The extra space will be divided evenly between all children that use this option
fill 		- true if space given to child by the expand option is actually allocated to child , 
			  rather than just padding it. This parameter has no effect if expand is set to false. 
padding 	- extra space in pixels to put between this child and its neighbors, over and above 
			  the global amount specified by “spacing” property. If child is a widget at one of 
			  the reference ends of box , then padding pixels are also put between child and the
			  reference edge of box"

```smalltalk
SpBoxLayout newVertical  spacing: 15;
	add: #button1 expand: false fill: true padding: 5;
	add: #button2 withConstraints: [ :constraints | constraints width: 30; padding: 5];
	addLast: #button3 expand: false fill: true padding: 5;
	yourself
```

Element in a vertical box will use all available horizontal space, and fill 
vertical space according to the rules. This will be inverted with horizontal box.

Box layout can be composed, we can add a box to an existing one.
	  
### GridLayout (SpGridLayout, SpGridConstraints and SpGridAxisConstraints)
I can arrange submorphs in a grid according to its properties (position and 
span, see GridLayoutProperties), and according certain layout properties: 
I can place my elements in a grid, following some constraints: 
 - a position is mandatory (columnNumber@rowNumber)
 - a span can be added if desired (columnExtension@rowExtention)

 - columnHomogeneous -> weather a columns will have same size.
 - rowHomogeneous -> weather a row will have same size. 
 - padding -> the padding to start drawing cells ??? => to be confirmed
 - colSpacing -> the column space between cells
 - rowSpacing -> the row space between cells

```smalltalk
SpGridLayout new
		add: 'Name:' at: 1@1;
		add: #nameText 	at: 2@1;
		add: 'Password:' at: 1@2;
		add: #passwordText at: 2@2;  
		add: #acceptButton at: 1@3;
		add: #cancelButton at: 2@3 span: 2@3;
		add: 'test label' at: 1@4;
		yourself
```		
As of this writing (january 13, 2020), we cannot add a box layout to a grid.

### Paned layout (SpPanedLayout and SpPanedConstraints)
A paned layout is like a Box Layout (it places childen in vertical or horizontal 
fashion), but it will add a splitter in between, that user can drag to resize the panel.
In exchange, a paned layout can have just two children. Position Indicates 
original position of splitter. It can be nil (then it defaults to 50%) or It can 
be a percentage (e.g. 30 percent)

```smalltalk
SpPanedLayout newHorizontal position: 80 percent;
                        add: '#acceptButton';
                        add: #cancelButton; yourself.
```

## Commander
Add command to menu and action item => see doc in the booklet.


## ObservableSlot
SpObservableSlot is used in variable declaration using slot, to define variable
that could change and could be observable. Look for example at the definition of
class SpPresenter

## Transmission and MillerLayout
MillerLayout allow you to compose column data, where the data on the right column 
depend of the data you selected on the left column. Transmission is the technology
used to ease the transition between those 2 columns. 
For an introduction, look at Advanced Pharo book chapter on Glamour

