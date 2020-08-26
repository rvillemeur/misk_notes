									C++ reference

# basic structure

| source.h						|source.cpp							|main.cpp                        |
|-------------------------------|-----------------------------------|--------------------------------|
| #ifndef SOURCE_H				|#include "source.h"				|#include "source.h"             |
| #define SOURCE_H				|#include <iostream>				|                                |
| 								|									|                                |
| namespace myNamespace			|using namespace myNamespace;		|using namespace myNamespace;    |
| {								|using namespace std;				|                                |
| 	class myClass				|									|                                |
| 	{							|void myClass::method1()			|int main(int argc, char* argv[]) |
| 		public:					|{									|{                               |
| 			void method1();		|	cout << "hello world";			|	myClass var1;                |
| 	};							|}									|	var1.method1();              |
| }								|									|	return 0;                    |
| 								|									|}                               |
| #endif /* SOURCE_H */			|									|                                |


# C++ compilation process
```
command line: g++ -Wall -Wextra -pedantic -std=c++0x  -o prog1 main.cpp source.cpp
```

```
+-----------+					  +-----------+			    +----------+			   +-----------+		   +----------+
|source code|- C++ preprocessor ->|temporary  |- compiler ->|assembler |-- assembler ->|object code|- linker ->|   final  |
|	file    |		g++ -E		  | file      |	  g++ -S	|file *.s  |	g++ -c	   |file (*.o) |  g++ -o   |executable|
+-----------+					  +-----------+			    +----------+			   +-----------+		   +----------+
```

# comment

// Comment to end of line

/*

Multi-line

comment

*/


# namespace
```
namespace myNamespace
{
}

typename::X                      	// Name X defined in class T
namespace::X                      	// Name X defined in namespace N
::X                       			// Global name X (mostly for c function)
using namespace myNamespace			// to avoid myNamespace::X
```

# base type and Class declaration

## base type

	void
    int, short int, long int, long long int, unsigned int, unsigned short int, unsigned long int, unsigned long long int,
    float, double, long double
	char, wchar_t
	bool
	size_t (represent the size of any object (including arrays) in the particular implementation)
	ptrdiff_t (represent the difference between pointers.)
	nullptr, nullptr_t

## other type declaration

	enum (enum1 {var1, var2};) 							// type with limited set of values.
	enum class Salutation : char { mr, ms, co, none }; 	//scoped enumeration (cc++11)
	typedef (string char*;)								// type alias
	extern												// Information only, declared elsewhere
	auto												// automatic type deduction (c++11)
	{1,2,3,4}											// initializer list

## class declaration
```
	class|struct|union class_name[:[public|private|protected]parent_class]
	{
		[public|proctected|private]:
			[explicit] class_name();				        //constructor
			~class_name();							        //destructor
			class_name(const class_name& param); 	        //copy constructor
            class_name& operator=(const class_name& other)  //copy assignment operator
			class_name(class_name&& param);			        //move constructor (c++11)
            class_name& operator=(class_name&& other)       //move assignment operator
			virtual typename method() =0;			        //pure virtual function


			[friend|static|const] typename member [const];
			[friend|static|const] typepename [const] method([const] typename param1 [const], parame2) [const|override|noexcept|final];


			}
```
The keyword *this* represent a pointer to the object whose member function is being executed.

Rule of 5:
The rule of five is a rule of thumb in C++ that claims that if a class defines 
any of the following then it should probably explicitly define all five:
   * destructor
   * copy constructor
   * copy assignment operator
   * move constructor
   * move assignment operator


## const declaration
```
	//  #1      #2                #3      #4      #5
   int const * const Method3(int const * const&) const;
```
(Equivalent to  const int* const  Method3(const int* const&) const;)
\#5 the entire method declaration does not modify the non mutable members of its class.

\#4 the pointer to the left is const and may not be changed to point to a different location.

\#3 says that the int to the left is const.

\#2 says that the pointer to the left is const.

\#1 says that the int to the left is const.

## Bit Fields
Bit Fields are used to define the class members that can occupy less storage than an integral type. 
This field is applicable only for integral type(int, char, short, long...) excludes float or double.

```
struct A
{
        unsigned a:2; // possible values 0..3,  occupies first 2 bits of int
        unsigned b:3; // possible values 0..7,  occupies next 3 bits of int
        unsigned :0;  // moves to end of next integral type
        unsigned c:2;
        unsigned :4;  // pads 4 bits in between c & d
        unsigned d:1;
};
```

# statement
```
if (x) a;                 // If x is true (not 0), evaluate a
else if (y) b;            // If not x and y (optional, may be repeated)
else c;                   // If not x and not y (optional)

while (x) a;              // Repeat 0 or more times while x is true
do a; while (x);          // Equivalent to: a; while(x) a;
for (x; y; z) a;          // Equivalent to: x; while(y) {a; z;}

switch (x) {              // x must be int
  case X1: a;             // If x == X1 (must be a const), jump here
  case X2: b;             // Else if x == X2, jump here
  default: c;             // Else jump here (optional)
}

break;                    // Jump out of while, do, or for loop, or switch
continue;                 // Jump to bottom of while, do, or for loop
return x;                 // Return x from function to caller

try { a; }
catch (T t) { b; }        // If a throws a T, then jump here
catch (...) { c; }        // If a throws something else, jump here
```

# Operator (https://en.wikipedia.org/wiki/Operators_in_C_and_C%2B%2B)

## Arithmetic operators

|Operator name 				|Syntax 	|overload               |
|---------------------------|-----------|-----------------------|
|Basic assignment 			|a = b 		|R& T::operator =(S b); |
|Addition 					|a + b 		|R T::operator +(S b);  |
|Subtraction 				|a - b 		|R T::operator -(S b);  |
|Unary plus  				|+a 		|R T::operator +();	    |
|Unary minus  				|-a 		|R T::operator -(); 	|
|Multiplication 			|a \* b	    |R T::operator \*(S b);	|
|Division 					|a \/ b 	|R T::operator \/(S b);	|
|Modulo 					|a % b 	    |R T::operator %(S b);	|
|Increment 					|++a 		|R& T::operator ++();	|
|							|a++ 		|R T::operator ++(int);	|
|Decrement 		 			|--a 		|R& T::operator --();   |
|							|a-- 		|R T::operator --(int); |

### Note:
C++ uses the unnamed dummy-parameter int to differentiate between prefix and
suffix decrement operators.

## Comparison operators/relational operators
|Operator name     			|Syntax  	|overload               |
|---------------------------|-----------|-----------------------|
|Equal to 					|a == b 	|R T::operator ==(S b); |
|Not equal to 				|a != b		|R T::operator !=(S b); |
|Greater than 				|a > b 		|R T::operator >(S b);  |
|Less than 					|a < b 		|R T::operator <(S b);  |
|Greater than or equal to 	|a >= b 	|R T::operator >=(S b); |
|Less than or equal to 		|a <= b 	|R T::operator <=(S b); |

## Member and pointer operators
|Operator name 				|Syntax 	|overload 				|comment                                |
|---------------------------|-----------|-----------------------|---------------------------------------|
|Array subscript 			|a[b] 		|R T::operator [](S b); |                                       |
|Pointer dereference		|*a			|R T::operator *(); 	|("object pointed to by a")             |
|Reference 					|&a 		|R T::operator &(); 	|("address of a") 	                    |
|Structure dereference  	|a->b 		|R T::operator ->();   	|("member b of object pointed to by a") |
|Structure reference 		|a.b 		|						|("member b of object a")               |
|rvalue reference           |&&a        |                       |                                       |
### Note on pointers and reference.
Pointers and reference are one of the tricky part of C and C++

if A is a pointer, it contains the adress of another variable.
'*' dereference the pointer, to get the content of the adress where A point to.
'&' give the adress of the variable.

**BUT, in C++, the & operator has an additional meaning**. It can be used to pass
value by reference.

There are numerous example of pointer arithmetic on the internet, and it won't
be covered here.

#### Exemple:
int B //declare the variable.
&B give the address of the variable in memory.
int *A //declare a pointer to an int.
&A give the address of the pointer in memory
*A give the address of the content pointed by A
So you can do:
*A = &B

The C language is pass-by-value without exception. Passing a pointer as a
parameter does not mean pass-by-reference as with C++. The rule is the following:
**A function is not able to change the actual parameters value.**

|C style:                           |C++ style:                         |
|-----------------------------------|-----------------------------------|
|```                                |```                                |
|void func(int *ref) {*ref = 4;}    |void func(int& ref) {ref = 4;}     |
|                                   |                                   |
|int myRef;                         |int myRef;                         |
|func(&myRef); //passed by pointer  |func(myRef); //passed by reference.|
|```                                |```                                |


### lvalue, rvalue and move semantic
```
    #1  #2
int a = 3.
```

\#1 is an l(eft)value. The operand is modifiable.

\#2 is an r(ight)value. A temporary object that will diseappear on the next instruction.

By implementing the move operator, we can assign a temporary value without
recreating using copy constructor it.
https://www.internalpointers.com/post/c-rvalue-references-and-move-semantics-beginners
https://www.cprogramming.com/c++11/rvalue-references-and-move-semantics-in-c++11.html

At the end of a function call, local variable on the stack are destroyed, even
if they are affected to a reference. To keep them, the program have to copy them
to a new memory location. The move semantic avoid this kind of useless copy.

## Logical operators
|Operator name 	  			|Syntax   	|overload 	              |
|---------------------------|-----------|-------------------------|
|Logical negation (NOT) 	|!a			|R T::operator !();       |
|Logical AND 				|a && b		|R T::operator &&(S b);   |
|Logical OR 				|a \|\| b	|R T::operator \|\|(S b); |

## Bitwise operators
|Operator name 	  			|Syntax   	|overload               |
|---------------------------|-----------|-----------------------|
|Bitwise NOT 				|~a			|R T::operator ~();     |
|Bitwise AND 				|a & b		|R T::operator &(S b);  |
|Bitwise OR 				|a \| b		|R T::operator \|(S b); |
|Bitwise XOR 				|a ^ b		|R T::operator ^(S b);  |
|Bitwise left shift[c] 		|a << b 	|R T::operator <<(S b); |
|Bitwise right shift[c][d]  |a >> b 	|R T::operator >>(S b); |

## Compound assignment operators
|Operator name 	  				|Syntax   	|Meaning     	|overload 	            |
|-------------------------------|-----------|---------------|-----------------------|
|Addition assignment 			|a += b 	|a = a + b 		|R T::operator +=(S b); |
|Subtraction assignment 		|a -= b 	|a = a - b 		|R T::operator -=(S b); |
|Multiplication assignment 		|a *= b 	|a = a * b 		|R T::operator *=(S b); |
|Division assignment 			|a /= b 	|a = a / b 		|R T::operator /=(S b); |
|Modulo assignment 				|a %= b 	|a = a % b 		|R T::operator %=(S b); |
|Bitwise AND assignment 		|a &= b		|a = a & b 		|R T::operator &=(S b); |
|Bitwise OR assignment 			|a \|= b	|a = a \| b 	|R T::operator \|=(S b) |
|Bitwise XOR assignment 		|a ^= b		|a = a ^ b 		|R T::operator ^=(S b); |
|Bitwise left shift assignment 	|a <<= b 	|a = a << b 	|R T::operator <<=(S b) |
|Bitwise right shift assignment	|a >>= b 	|a = a >> b 	|R T::operator >>=(S b) |

## Other operator:
|Operator name 	  				|Syntax   	|overload                           |
|-------------------------------|-----------|-----------------------------------|
|Function call					|a(a1, a2) 	|R T::operator ()(S a1, U a2, ...); |
|Ternary conditional 			|a ? b : c  |                                   |

### Note: function call overload allow to do functor. See c++11 lambda for alternative
c++11 lambda: [capture list] (parameter list) -> return type { function body }
capture list is a list of local variables defined in the enclosing function;
[=] means that the outer scope is passed to the lambda by value. 
[&] means that the outer scope is passed to the lambda by reference.
[](int x, int y) -> int { return x + y; }

# Memory management and type conversion
Size-of 					sizeof(a) or sizeof(type)
type id						typeid(a)
Operator name 	  			Syntax   	     			overload
Conversion (C-style cast) 	(type)a or type(a)			T::operator R();
static_cast			 		static_cast<type>
dynamic_cast			 	dynamic_cast<type>
const_cast			 		const_cast<type>
reinterpret_cast			reinterpret_cast<type>

Allocate storage 			new type 					void* T::operator new(size_t x);
Deallocate storage			delete a 					void T::operator delete(void* x);

Array declaration			typename var[]
Allocate storage (array) 	new type[n] 				void* T::operator new[](size_t x);
Deallocate storage (array) 	delete[] a 					void T::operator delete[](void* x);


# preprocessor
```
#include <stdio.h>        // Insert standard header file
#include "myfile.h"       // Insert file in current directory

#define X some text       // Replace X with some text
#define F(a,b) a+b        // Replace F(1,2) with 1+2
#define X \
  some text               // Line continuation
#undef X                  // Remove definition

#if defined(X)            // Condional compilation ( X)
#ifdef
#ifndef
#elif
#else                   // Optional ( X or #if !defined(X))
#endif                    // Required after #if, #ifdef

#pragma					  // compiler specific
#line
```

# template
```
template <typename T> function_declaration(T) {};
```
usage: var1 = function_declaration<type>(param1);

```
template <typename T> class my_class { T;};
```

usage: my_class<type> var1;

# OO design concept - design by adding concepts within the context of previously presented concepts

Find what varies to what is common, and encapsulate varying part into specific classes
• "Program to an interface, not an implementation."
• "Favor object composition over class inheritance."
• "Consider what should be variable in your design.

Instead of considering what might force a change to a design, consider what you want to be able to change without redesign.
```
commonality analysis	-> 		conceptual perspective		-> abstract class
						|-> 	specification perspective	|
variability analysis	-> 		implementation perspective	-> concrete class
```
1. Start out with a conceptual understanding of the whole in order to understand what needs to be accomplished.
2. Identify the patterns that are present in the whole.
3. Start with those patterns that create the context for the others.
4. Apply these patterns.
5. Repeat with the remaining patterns, as well as with any new patterns that were discovered along the way.
6. Finally, refine the design and implement within the context created by applying these patterns one at a time.