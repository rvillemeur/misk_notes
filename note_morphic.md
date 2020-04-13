# Note on Morphic Balloon and Athens.

Morphic is the default graphic stack in Pharo. However, it shows its age and its development style.

**Morph** is the default class you'll use when you want to display things on the 
screen Eventually, all the items you display we'll be converted to a **Form**. 
A Form is a bitmap, an array of pixel you can display on the screen

Morph >> drawOn: aCanvas.
Default Canvas defined in Form >> defaultCanvasClass, is **FormCanvas**

# World
Pharo world is managed by WorldMorph and its parent, PasteUpMorph.
A World, the entire Smalltalk screen, is a PasteUpMorph.  A World responds true to #isWorld.

Hierarchy of the morph to draw the entire world:
Morph -> BorderedMorph -> PasteUpMorph -> WorldMorph: 
 
You have other subworld, like **AthensWorldMorph**, but it doesn't look to be used by default.

Its state is hanled by WorldState class 
Everything can be found in Morphic-Core-Worlds package.

Funny things:
you can put a grid on the world: World gridVisibleOnOff 
You can identify its canvas: World canvas => it's a FormCanvas.
List its child: World listOfSteppingMorphs
Get Its size: World viewBox

# Cursor: HandMorph and Cursor
Cursor, or mouse, is also managed by a subclass of Morph: HandMorph
However, there is also a class Cursor.

HandMorph manage the logic of the cursor: click, double click, etc...
Cursor manage the display of the cursor: arrow, waiting, resize, etc...

Cursor classPool at: #NormalCursor put: cursor.
HandMorph classPool at: #NormalCursor put: form.

```smalltalk
HandMorph >> drawOn: aCanvas 
	"Draw the hand itself (i.e., the cursor)."

	temporaryCursor 
		ifNil: [aCanvas paintImage: NormalCursor at: bounds topLeft]
		ifNotNil: [aCanvas paintImage: temporaryCursor at: bounds topLeft].
```

When you initialize HandMorph:
HandMorph >> NormalCursor := CursorWithMask normal asCursorForm.

Cursor form are created on startup: 
Cursor class >> initialize
	self createStandardCursors.

# canvas: BaloonCanvas and FormCanvas
A canvas is a two-dimensional medium on which morphs are drawn in a 
device-independent manner. Canvases keep track of the origin and clipping 
rectangle, as well as the underlying drawing medium (such as a window, pixmap, 
or postscript script).

Morphics rendering is based on Balloon. Balloon engine is used for special 
rendering (see asBalloonCanvas), for example complex borders, it uses a plugin 
(B2DPlugin), has (has better) antialiasing.
(http://forum.world.st/Pharo-Balloon-td4781011.html)


TODO: Find relation between canvas, Form and BitBlt

#BitBlt
BitBlt represent a **block** transfer (BLT) of pixels into a rectangle (destX, 
destY, width, height) of the destinationForm.  The source of pixels may be a 
similar rectangle (at sourceX, sourceY) in the sourceForm, or a constant color, 
currently called halftoneForm.  If both are specified, their pixel values are 
combined with a logical AND function prior to transfer.  In any case, the pixels 
from the source are combined with those of the destination by as specified by 
the combinationRule.

## Relation between Balloon and BitBlt
```smalltalk
BalloonEngine >> initialize
	| w |
	super initialize.
	w := Display width > 2048 ifTrue: [ 4096 ] ifFalse: [ 2048 ].
	externals := OrderedCollection new: 100.
	span := Bitmap new: w.
	self
		bitBlt:
			((BitBlt toForm: Display)
				destRect: Display boundingBox;
				yourself).
	forms := #().
	deferred := false
```

# Form: Display bitmap
A rectangular array of pixels, used for holding images.  All pictures, including 
character images are Forms.  The depth of a Form is how many bits are used to 
specify the color at each pixel.  The actual bits are held in a Bitmap, whose 
internal structure is different at each depth.  Class Color allows you to deal 
with colors without knowing how they are actually encoded inside a Bitmap.
	  
The supported depths (in bits) are 1, 2, 4, 8, 16, and 32.  The number of actual 
colors at these depths are: 2, 4, 16, 256, 32768, and 16 million. 	Forms are 
indexed starting at 0 instead of 1; thus, the top-left pixel of a Form has 
coordinates 0@0.
    
Forms are combined using BitBlt.  Forms that repeat many times to fill a large 
destination are InfiniteForms.

Important messages:
	colorAt: x@y		Returns the abstract Color at this location
	displayAt: x@y		shows this form on the screen
	displayOn: aMedium at: x@y	shows this form in a Window, a Form, or other DisplayMedium
	fillColor: aColor		Set all the pixels to the color.
	edit		launch an editor to change the bits of this form.
	pixelValueAt: x@y	The encoded color.  The encoding depends on the depth.
    

Update form display size: 'form magnifyBy: 2.'
Creating empty form: Form extent: 16@16 depth: 32

(Form
	extent: 12@19
	depth: 32
	fromArray: #( 3875735066 922945050 0 0 0 0 0 0 0 0 0 0 3875735066 3171091994 922945050 0 0 0 0 0 0 0 0 0 3875735066 4293256936 3171091994 922945050 0 0 0 0 0 0 0 0 3875735066 4294967295 4293256936 3171091994 922945050 0 0 0 0 0 0 0 3875735066 4294967295 4294967295 4293256936 3171091994 922945050 0 0 0 0 0 0 3875735066 4294967295 4294967295 4294967295 4293256936 3171091994 922945050 0 0 0 0 0 3875735066 4294967295 4294967295 4294967295 4294967295 4293256936 3171091994 922945050 0 0 0 0 3875735066 4294967295 4294967295 4294967295 4294967295 4294835709 4293059300 3171091994 922945050 0 0 0 3875735066 4294967295 4294967295 4294967295 4294835709 4294704123 4294506744 4292664799 3171091994 922945050 0 0 3875735066 4294967295 4294967295 4294835709 4294704123 4294506744 4294309365 4294046193 4292269784 3171091994 922945050 0 3875735066 4294967295 4294835709 4294704123 4294506744 4294309365 4294046193 4293848814 4293585642 4291809233 3171091994 922945050 3875735066 4294835709 4294704123 4294506744 4294309365 4294046193 4293848814 4293585642 4293322470 4293059298 4291414475 3171091994 3875735066 4294704123 4294506744 4294309365 4292467163 4293848814 4293585642 3171091994 3171091994 3171091994 3171091994 3171091994 3875735066 4294506744 4294309365 4292467163 4093838874 4288980395 4293322470 3154314778 1292043802 0 0 0 3875735066 4294309365 4292467163 4093838874 922945050 3540190746 4293059298 4291414475 3540190746 0 0 0 3875735066 4292467163 4093838874 922945050 0 3020097050 4289769653 4292598747 3020097050 1292043802 0 0 3171091994 4093838874 922945050 0 0 922945050 3607299610 4292401368 4290822338 3506636314 0 0 0 0 0 0 0 0 3020097050 4290822338 4292072403 3422750234 0 0 0 0 0 0 0 0 436405786 3607299610 2650998298 822281754 0 0)
	offset: 0@0).

