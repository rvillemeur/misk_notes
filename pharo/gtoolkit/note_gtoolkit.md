Note on GToolkit

Two goals of GToolkit
-> provide a custom view for object, instead of a generic representation
-> give a way to interact with the environment, to query it more easily.

"everything about software, including code, is data (object)"

1. customize inspector
Add a method on the instance side, with pragma <gtView>
Ex:
gtViewContactsListOn: aView
	<gtView>
	
aView is a subtype of GtPhlowProtoView or GtPhlowView	
To get a list of all the view in the system: #gtView gtPragmas

2. document object.
add comment in the pillar format in the comment part of the class.
For a full definition, look at class PRPillarGrammar

Add example and link:
${example:GtCSPictureExamples>>#pictureWithFacesAndForm|noCode|previewShow=gtPictureFor:}$

Header:
!!Header

Load file: 
${changes:01-createFileOnDisk.ombu}$

https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet/blob/master/Chapters/PillarSyntax.pillar


3. add item to the main board.
https://spectrum.chat/gtoolkit/how-to/adding-items-to-the-list-of-tools-slideshows-docs-on-the-gt-tab~0438f838-6ac9-422f-95b4-9085f19af9f7

GtHome>>documentationSection
    <gtHomeSection>
    ^ GtHomeDocumentationSection new
        priority: 20

add a new subclass of GtHomeSection and an extension method on GtHome with the gtHomeSection pragma

Look at package GToolkit-World

4. provide example
Add the pragma <gtExample> to a method.

5. Créer des présentation
See class GtSlideShow and GtPharo101 for example

6. Graphics
Look at Sparta (drawing), Block (low level, layout, event) and Brick (high level widget).

