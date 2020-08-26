# Note on Form and diplay color:
A bitmap image is a raster image (containing pixel data as opposed to vector 
images) format. Each pixel of a bitmap image is defined by a single bit or a 
group of bits. Hence, it is called the bitmap or a map of bits and pixels.

A Bitmap image is an uncompressed file format which means, every pixel of an 
image has its own bit (or group of bits) in the file. 
 
In Pharo, a Form is a rectangular array of pixels, used for holding images.  
All pictures, including character images are Forms. 

Creation of a Form:
```smalltalk
Form extent: extentPoint depth: bitsPerPixel fromArray: anArray offset: offsetPoint 
```

The depth of a Form is how many bits are used to specify the color at each pixel.  
The supported depths (in bits) are 1, 2, 4, 8, 16, and 32. 
The number of actual colors at these depths are: 2, 4, 16, 256, 32768, and 16 million.

The color depth is a measure of an individual image pixel to accurately 
represent a color. Color depth is calculated in bits-per-pixel or bpp.

For example, 1-bit color depth or 1bpp means a pixel can have a 1-bit color or 2 
values. Monochromatic images have 1-bit color depth because a pixel can be true 
black or true white.

Since we have 4 pixels per row, we have 1 bits represent the color.

You can also have an alpha-channel to add transparency in the image using 32-bit 
color depth.

Data is stored in Byte - remember than 8 bit = 1 bytes
Each entry of the color pallet takes 4 bytes to define a color


To construct an image, we need to know how many bits or byte an individual pixel 
contains in the Pixel Data. For the sake of convenience, let’s say, each pixel 
can be printed using just 1 byte. Hence our pixel data will have N x M bytes to 
construct an image of size N x M pixels.

The coordinates of a Form start from the top-left corner much like most graphic
system out there (why ? Because Western language are mostly written left to right,
top to bottom, and initial text display follow this convention, instead of
classic cartesian coordinate).


The next part is writing Pixel Data. Since the bit-depth of our image is 24, 
we have 3 bytes to represent a BGR color in the order. Since we have 5 pixels 
per row, we have 15 bytes in a row. We need to add 1 extra byte at the end of a 
row for padding such that total row bytes become divisible by 4 bytes.


|Depth   | number of color  |
|--------|------------------|
|1       |2^1 = 2           |
|2       |2^2 = 4           |
|4       |2^4 = 16          |
|8       |2^8 = 256         |
|16      |2^16 = 32768      |
|32      |2^32 = 16 millions|
	 
Forms are indexed starting at 0 instead of 1; thus, the top-left pixel of a Form has 
coordinates 0@0.

To keep compatibility between multiple color depth, each pixel can be printed using just 1 byte. 
1 bit (black and white)


Form
extent: size of the form
depth: number of bit to specify color for each pixel
fromArray: Array of pixel
offset: ???

# Example

## Normal mouse cursor:

playing with color and form.
(Form extent: 32@2 "size of the form"
 depth: 1 "color depth")
 initFromArray: #( "pixel color, expressed on 4 bytes"
		2r10011000000100010000000000000001
		2r11000000000000000000000000000000
) 
; magnifyBy: 10.


(Form extent: 7@1 "size of the form"
 depth: 32 "color depth")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"colore are:
2r 00000000 00000000 00000000 00000000 
     ALPHA    RED 		BLUE     GREEN   "
		16rffff0000 "red"
		16rff0000ff "blue"
		16rff00ff00 "green"
		16rff000000 "black"
		16rffffffff "white"
		16rf0ff00d9 "pink"
		16r2fff0000 "red with opacity"
) 
; magnifyBy: 15.

(Form extent: 3@3 "size of the form"
 depth: 32 "color depth")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"colore are:
2r 00000000 00000000 00000000 00000000 
     ALPHA    RED 		BLUE     GREEN   "
		16rffff0000 "red" 	 16rff000000 "black" 16rff0000ff "blue"
		16rff000000 "black" 16rffffffff "white" 16rff000000 "black" 
		16rff00ff00 "green" 16rff000000 "black" 16rffffff00 "yello"

) 
; magnifyBy: 15.
**24 bits doesn't have alpha channel -> to be confirmed on pharo**

"you can define the color of 2 pixel with color depth 16"
(Form extent: 6@1 "size of the form"
 depth: 16 "color depth - 16 => 2 bits to define color value 65K color possible")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"[ 0  XXXXX XXXXX XXXXX ]
     ----- ----- -----
       R     G     B
     first pixel 		second pixel   "
		2r01111100000000000000000000011111 "red - blue"
		2r00000011111000000111111111100000 "green -yellow"
		2r01111111111111111000000000000000 "white -black"
) 
; magnifyBy: 25.

"you can define the color of 4 pixel with color depth 16"
(Form extent: 4@64 "size of the form"
 depth: 8 "color depth - 16 => 2 bits to define color value")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"[ 00000000 00000000 00000000 00000000]
	first 		second    third    fourth pixel   
  Each pixel can have 2^8 = 256 different color"
"[ 00000000 00000000 00000000 00000000]"
2r00000000010000001000000011000000
2r00000001010000011000000111000001
2r00000010010000101000001011000010
2r00000011010000111000001111000011
2r00000100010001001000010011000100
2r00000101010001011000010111000101
2r00000110010001101000011011000110
2r00000111010001111000011111000111
2r00001000010010001000100011001000
2r00001001010010011000100111001001
2r00001010010010101000101011001010
2r00001011010010111000101111001011
2r00001100010011001000110011001100
2r00001101010011011000110111001101
2r00001110010011101000111011001110
2r00001111010011111000111111001111
2r00010000010100001001000011010000
2r00010001010100011001000111010001
2r00010010010100101001001011010010
2r00010011010100111001001111010011
2r00010100010101001001010011010100
2r00010101010101011001010111010101
2r00010110010101101001011011010110
2r00010111010101111001011111010111
2r00011000010110001001100011011000
2r00011001010110011001100111011001
2r00011010010110101001101011011010
2r00011011010110111001101111011011
2r00011100010111001001110011011100
2r00011101010111011001110111011101
2r00011110010111101001111011011110
2r00011111010111111001111111011111
2r00100000011000001010000011100000
2r00100001011000011010000111100001
2r00100010011000101010001011100010
2r00100011011000111010001111100011
2r00100100011001001010010011100100
2r00100101011001011010010111100101
2r00100110011001101010011011100110
2r00100111011001111010011111100111
2r00101000011010001010100011101000
2r00101001011010011010100111101001
2r00101010011010101010101011101010
2r00101011011010111010101111101011
2r00101100011011001010110011101100
2r00101101011011011010110111101101
2r00101110011011101010111011101110
2r00101111011011111010111111101111
2r00110000011100001011000011110000
2r00110001011100011011000111110001
2r00110010011100101011001011110010
2r00110011011100111011001111110011
2r00110100011101001011010011110100
2r00110101011101011011010111110101
2r00110110011101101011011011110110
2r00110111011101111011011111110111
2r00111000011110001011100011111000
2r00111001011110011011100111111001
2r00111010011110101011101011111010
2r00111011011110111011101111111011
2r00111100011111001011110011111100
2r00111101011111011011110111111101
2r00111110011111101011111011111110
2r00111111011111111011111111111111
); magnifyBy: 25


"you can define the color of 8 pixel with color depth 16"
(Form extent: 8@2 "size of the form"
 depth: 4 "color depth - 16 => 2 bits to define color value")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]
	first 		second    third    fourth pixel   
  Each pixel can have 2^4 = 16 different color"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]"
 2r00000001001000110100010101100111 "8 colors"
 2r10001001101010111100110111101111 "8 colors"
) 
; magnifyBy: 25.

"you can define the color of 16 pixel with color depth 2"
(Form extent: 16@1 "size of the form"
 depth: 2 "color depth - 16 => 2 bits to define color value")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]
	first 		second    third    fourth pixel   
  Each pixel can have 2^2 = 4 different color"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]"
 2r00011011000110110001101100011011 "8 colors"
) 
; magnifyBy: 25.

"you can define the color of 16 pixel with color depth 2"
(Form extent: 32@2 "size of the form"
 depth: 1 "color depth - 16 => 2 bits to define color value")
 initFromArray: #( 
 2r10101010101010101010101010101010
 2r01010101010101010101010101010101 "2 colors"
) 
; magnifyBy: 25.



(Form extent: 16@16
	depth: 1
	fromArray: #(
		2r10000001000000000000000000000000
		2r11000000000000000000000000000000
		2r11100000000000000000000000000000
		2r11110000000000000000000000000000
		2r11111000000000000000000000000000
		2r11111100000000000000000000000000
		2r11111110000000000000000000000000
		2r11111000000000000000000000000000
		2r11111000000000000000000000000000
		2r10011000000000000000000000000000
		2r00001100000000000000000000000000
		2r00001100000000000000000000000000
		2r00000110000000000000000000000000
		2r00000110000000000000000000000000
		2r00000011000000000000000000000000
		2r00000011000000000000000000000000) 
	offset: 0@0) magnifyBy: 10.
    

# technical
The actual bits are held in a Bitmap, whose internal structure is different at each depth.
Class Color allows you to deal with colors without knowing how they are actually encoded inside a Bitmap.

# Reference
https://itnext.io/bits-to-bitmaps-a-simple-walkthrough-of-bmp-image-format-765dc6857393
http://paulbourke.net/dataformats/bitmaps/
