**Literals**
========

Literals create objects you can use in your program. Literals include:

 - Booleans and nil

 - Numbers

 - Strings

 - Symbols

 -  Arrays

 -  Hashes

 -  Ranges

 -  Regular Expressions

 -  Procs


Booleans and nil
----------------

nil and false are both false values. nil is sometimes used to indicate “no value” or “unknown” but evaluates to false in conditional expressions.

true is a true value. All objects except nil and false evaluate to a true value in conditional expressions.

(There are also the constants TRUE, FALSE and NIL, but the lowercase literal forms are preferred.)

Numbers
-------
In Ruby, numbers without decimal points are called integers, and numbers with decimal points are usually called floating-point numbers or, more simply, floats (you must place at least one digit before the decimal point). An integer literal is simply a sequence of digits eg. 0, 123, 123456789. Underscores may be inserted into integer literals (though not at the beginning or end), and this feature is sometimes used as a thousands separator. Example : 1_000_000_000. Underscore characters are ignored in the digit string.

Ruby integers are objects of class Fixnum or Bignum. The Fixnum and Bignum classes represent integers of differing sizes. Both classes descend from Integer (and therefore Numeric). The floating-point numbers are objects of class Float, corresponding to the native architecture's double data type. The Complex, BigDecimal, and Rational classes are not built-in to Ruby but are distributed with Ruby as part of the standard library. We shall be talking about classes in detail later.

Converting a String to Integer
You can use the Integer method to convert a String to an Integer:
```
    Integer("123")      # => 123
    Integer("0xFF")     # => 255
    Integer("0b100")    # => 4
    Integer("0555")     # => 365
```
You can also pass a base parameter to the Integer method to convert numbers from a certain base
```
    Integer('10', 5)    # => 5
    Integer('74', 8)    # => 60
    Integer('NUM', 36)  # => 30910
```
Note that the method raises an ArgumentError if the parameter cannot be converted:
```
    Integer("hello")
    # raises ArgumentError: invalid value for Integer(): "hello"
    Integer("23-hello")
    # raises ArgumentError: invalid value for Integer(): "23-hello"
```
You can also use the String#to_i method. However, this method is slightly more permissive and has a different behavior than Integer:
```
    "23".to_i         # => 23
    "23-hello".to_i   # => 23
    "hello".to_i      # => 0
```
  String#to_i accepts an argument, the base to interpret the number as:
```
    "10".to_i(2) # => 2
    "10".to_i(3) # => 3
    "A".to_i(16) # => 10
```
Creating an Integer
```
    0       # creates the Fixnum 0
    123     # creates the Fixnum 123
    1_000   # creates the Fixnum 1000. You can use _ as separator for readability
```
 By default the notation is base 10. However, there are some other built-in notations for different bases:
```
    0xFF    # Hexadecimal representation of 255, starts with a 0x
    0b100   # Binary representation of 4, starts with a 0b
    0555    # Octal representation of 365, starts with a 0 and digits
```
Rounding Numbers
----------------

The round method will round a number up if the first digit after its decimal place is 5 or higher and round down if that digit is 4 or lower. This takes in an optional argument for the precision you're looking for.
```
4.89.round        # => 5
4.25.round        # => 4
3.141526.round(1) # => 3.1
3.141526.round(2) # => 3.14
3.141526.round(4) # => 3.1415
```
Floating point numbers can also be rounded down to the highest integer lower than the number with the floor method
```
4.9999999999999.floor # => 4
```
They can also be rounded up to the lowest integer higher than the number using the ceil method
```
4.0000000000001.ceil  # => 5
```
Even and Odd Numbers
--------------------

The even? method can be used to determine if a number is even
```
4.even?      # => true
5.even?      # => false
```
The odd? method can be used to determine if a number is odd
```
4.odd?       # => false
5.odd?       # => true
```

Rational Numbers
----------------

Rational represents a rational number as numerator and denominator:
```
r1 = Rational(2, 3)
r2 = 2.5.to_r
r3 = r1 + r2
r3.numerator   # => 19
r3.denominator # => 6
Rational(2, 4) # => (1/2)
```
Other ways of creating a Rational
```
Rational('2/3')  # => (2/3)
Rational(3)      # => (3/1)
Rational(3, -5)  # => (-3/5)
Rational(0.2)    # => (3602879701896397/18014398509481984)
Rational('0.2')  # => (1/5)
0.2.to_r         # => (3602879701896397/18014398509481984)
0.2.rationalize  # => (1/5)
'1/4'.to_r       # => (1/4)
```
Complex Numbers
---------------
```
1i     # => (0+1i)
1.to_c # => (1+0i)
rectangular = Complex(2, 3)  # => (2+3i)
polar       = Complex('1@2') # => (-0.4161468365471424+0.9092974268256817i)

polar.rectangular # => [-0.4161468365471424, 0.9092974268256817]
rectangular.polar # => [3.605551275463989, 0.982793723247329]
rectangular + polar # => (1.5838531634528576+3.909297426825682i)
```

Strings
======

A String object holds and manipulates an arbitrary sequence of bytes, typically representing characters. String objects may be created using String::new or as literals.

Quotes
------

Ruby string literals are enclosed within single and double quotes.

Example:
```
!/usr/bin/ruby
puts 'Hello everyone'
puts "Hello everyone"  
```


Difference between single-quoted and double-quoted String literals
------------------------------------------------------------------


The main difference is that double-quoted String literals support string interpolations and the full set of escape sequences.

For instance, they can include arbitrary Ruby expressions via interpolation:
```
# Single-quoted strings don't support interpolation
puts 'Now is #{Time.now}'
# Now is #{Time.now}

# Double-quoted strings support interpolation
puts "Now is #{Time.now}"
# Now is 2016-07-21 12:43:04 +0200
```
Double-quoted strings also support the entire set of escape sequences including "\n", "\t"...
```
puts 'Hello\nWorld'
# Hello\nWorld

puts "Hello\nWorld"
# Hello
# World
```
... while single-quoted strings support no escape sequences, baring the minimal set necessary for single-quoted strings to be useful: Literal single quotes and backslashes, '\'' and '\\' respectively.
