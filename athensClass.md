
# Base class:
*AthensSurface* and its subclass *AthensCairoSurface* 
-> initialize a new surface

*AthensCanvas* is the central object used to perform drawing on an *AthensSurface*
Canvas is not directly instanciated but used through a call like 
*surface drawDuring: [:canvas | .... ]*

The rendering dispatch is `rendering dispatch  Canvas->receiver->paint`

Once your are painting on the AthensCanvas, the following steps are used:
1. Set the path
2. Define paint method
3. Draw the path accordingly to the paint method.

# draw class

AthensShape and AthensPath

## Path
Athens always has an active path. 

Use AthensPathBuilder or AthensSimplePathBuilder to build a path
They will assemble segment for you

createPath: This message exist in all important Athens class:
* AthensCanvas
* AthensSurface
* AthensPathBuilder

*createPath: aPathCreatingBlock*

Using it return a new path:
```smalltalk
surface createPath: [:builder |
		builder
			absolute;
			moveTo: 100@100;
			lineTo: 100@300;
			lineTo: 300@300;
			lineTo: 300@100;
			close ].
```

helper message in *AthensSimplePathBuilder*
- pathStart
- pathBounds -> give the limit of the bounds associated to the path

If you want to build path using only straight line, you can use the class
*AthensPolygon*


|path builder Messages  |Object Segment     |comment                     |
|-----------------------|-------------------|----------------------------|
|ccwArcTo: angle:       |AthensCCWArcSegment|counter clock wise segment  |
|cwArcTo:angle:         |AthensCWArcSegment |clock wise segment          |
|lineTo:                |AthensLineSegment  |straight line               |
|moveTo:                |AthensMoveSegment  |start a new contour         |
|curveVia: to:          |AthensQuadSegment  |quadric bezier curve        |
|curveVia: and: to:     |AthensCubicSegment |Cubic bezier curve          |
|reflectedCurveVia: to: |AthensCubicSegment |Reflected cubic bezier curve|
|string: font:          |                   |specific to cairo           |
|close                  |AthensCloseSegment |close the current contour   |


Coordinate class: *Absolute* or *Relative*
absolute: absolute coordinate from surface coordinate.
```smalltalk
    builder absolute;
			moveTo: 100@100;
			lineTo: 100@300;
			lineTo: 300@300;
			lineTo: 300@100;
			close
```
-> will draw a square in a surface which extent is 400@400 using absolute move.

relative: each new move is relative to the previous one.
```smalltalk
		builder relative ;
			moveTo: 100@100;
			lineTo: 200@0;
			lineTo: 0@200;
			lineTo: -200@0;
			close
```
-> will draw a square in a surface which extent is 400@400 using relative move.


## painting


### Paints
Paints can be created either from the surface or directly from a class that will
do the call to the surface for you.

any object can be treated as paint:
 - athensFillPath: aPath on: aCanvas
 - athensFillRectangle: aRectangle on: aCanvas
 - asStrokePaint

|surface message                                  |helper class        |  comment               |
|createFormPaint:                                 |                    |create paint from a Form|
|createLinearGradient: start: stop:               |LinearGradientPaint |linear gradient paint   |
|createRadialGradient: center: radius:            |RadialGradientPaint |Radial gradient paint   |
|createRadialGradient: center: radius: focalPoint:|RadialGradientPaint |Radial gradient paint   |
|createShadowPaint:                               |AthensShadowPaint   |???                     |
|createSolidColorPaint:                           |                    |fill paint              |
|createStrokePaintFor:                            |AthensStrokePaint   |stroke paint            |

a Canvas define its paint method:
* setPaint:
* setStrokePaint:

### Stroke
The *createStrokePaintFor* operation takes a virtual pen along the path. It allows the source 
to transfer through the mask in a thin (or thick) line around the path

### fill
The*createSolidColorPaint* operation instead uses the path like the lines of a coloring book, 
and allows the source through the mask within the hole whose boundaries are the 
path. For complex paths (paths with multiple closed sub-paths—like a donut—or
paths that self-intersect) this is influenced by the fill rule

### Note (To be confirmed)
But as often as not, the path is empty, and both calls will result in no change to your destination. 
Why is it empty so often? For one, it starts that way; but more importantly after each 
*createStrokePaintFor* or *createSolidColorPaint* it is emptied again to let you start building your next path.

### Gradient
Gradient will let you create gradient of color, either linear, or radial.

The color ramp is a collection of associations with keys - floating point values 
between 0 and 1 and values with Colors, for example:
{0 -> Color blue . 0.5 -> Color white. 1 -> Color red}.

You can use either helper class or calling surface messages:
```smalltalk
surface createLinearGradient: {0 -> Color blue .0.5 -> Color white. 1 -> Color red} start:  0@0  stop: 200@100.
```
or
```smalltalk
(LinearGradientPaint from: 0 @ 0 to: self extent) colorRamp: {0 -> Color white. 1 -> Color black}).
```

Start and stop point are reference to the current shape being drawn.
Exemple:
Create a vertical gradient
```smalltalk
canvas
    setPaint:
        (canvas surface
            createLinearGradient:
                {(0 -> Color blue).
                (0.5 -> Color white).
                (1 -> Color red)}
            start: 0@200
            stop: 0@400). 
    canvas drawShape: (0@200 extent: 300@400).
```

create a horizontal gradient:
```smalltalk
canvas
    setPaint:
        (canvas surface
            createLinearGradient:
                {(0 -> Color blue).
                (0.5 -> Color white).
                (1 -> Color red)}
            start: 0@200
            stop: 300@200). 
    canvas drawShape: (0@200 extent: 300@400).
```

create a diagonal gradient:
```smalltalk
canvas
    setPaint:
        (canvas surface
            createLinearGradient:
                {(0 -> Color blue).
                (0.5 -> Color white).
                (1 -> Color red)}
            start: 0@200
            stop: 300@400). 
    canvas drawShape: (0@200 extent: 300@400).
```

### drawing
Either you set the shape first and then you call *draw*, or you call the 
convenient method*drawShape:* directly with the path to draw as argument


# Playing
To help you practice your Athens drawing, you can use Athens sketch, migrated from SmalltalkHub:
http://smalltalkhub.com/#!/~NicolaiHess/AthensSketch

