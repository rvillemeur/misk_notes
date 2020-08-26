# note_athens
# introduction
Morphic is currently the way to go on pharo for Graphics.
As we have seen, it's splitted on multiple layer. However, all existing canvas
are pixel based, and not vector based. This can be an issue with current screen,
where the resolution can differ from machine to machine.

Enter Athens, a vector based graphic API. Under the scene, it can either use
balloon Canvas, or the cairo graphic library.

When you integrate Athens with Morphic, you'll use the rendering engine to 
create your picture. It's then transformed in a Form and displayed using on 
the screen using BitBlt.

# setup - the Athens hello-world
Athens come pre-built in the pharo image. However, to use it conventiently in your
project, it can be usefull to set-up some few methods on which we can build.

# Athens - vocabulary and drawing model
Athens is strongly influenced by the Cairo Graphic library, which was its first back-end.

The Cairo drawing model relies on a three layer model.

Any drawing process takes place in three steps:

1. First a mask is created, which includes one or more vector primitives or forms, i.e., circles, squares, TrueType fonts, Bézier curves, etc.
1. Then source must be defined, which may be a color, a color gradient, a bitmap or some vector graphics, and from the painted parts of this source a die cut is made with the help of the above defined mask.
1. Finally the result is transferred to the destination or surface, which is provided by the back-end for the output.
    
## the nouns:  destination, source, mask, path
### destination
The destination is the surface on which you're drawing. We created it in our initialize
method:
```smalltalk
surface := AthensCairoSurface extent: self extent
```

### source
The source is the "paint" you're about to work with.

### Mask
The mask is the most important piece: it controls where you apply the source to the destination.

### Path
The path is somewhere between part of the mask and part of the context. It is 
manipulated by path verbs, then used by drawing verbs.


The reason you are using Athens in a program is to draw. 


# Reference:
https://www.cairographics.org/tutorial/