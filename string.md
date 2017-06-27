Strings
======

A String object holds and manipulates an arbitrary sequence of bytes, typically representing characters. String objects may be created using String::new or as literals.

Quotes
------

Ruby string literals are enclosed within single and double quotes.

Example:
```ruby
!/usr/bin/ruby
puts 'Hello everyone'
puts "Hello everyone"  
```


Difference between single-quoted and double-quoted String literals
------------------------------------------------------------------


The main difference is that double-quoted String literals support string interpolations and the full set of escape sequences.

For instance, they can include arbitrary Ruby expressions via interpolation:
```ruby
# Single-quoted strings don't support interpolation
puts 'Now is #{Time.now}'
# Now is #{Time.now}

# Double-quoted strings support interpolation
puts "Now is #{Time.now}"
# Now is 2016-07-21 12:43:04 +0200
```
Double-quoted strings also support the entire set of escape sequences including "\n", "\t"...
```ruby
puts 'Hello\nWorld'
# Hello\nWorld

puts "Hello\nWorld"
# Hello
# World
```
... while single-quoted strings support no escape sequences, baring the minimal set necessary for single-quoted strings to be useful: Literal single quotes and backslashes, '\'' and '\\' respectively.

Creating a String
-----------------
Ruby provides several ways to create a String object. The most common way is using single or double quotes to create a "string literal":
```ruby
s1 = 'Hello'
s2 = "Hello"
```
The main difference is that double-quoted string literals are a little bit more flexible as they support interpolation and some backslash escape sequences.

There are also several other possible ways to create a string literal using arbitrary string delimiters. An arbitrary string delimiter is a % followed by a matching pair of delimiters:
```ruby
%(A string)
%{A string}
%<A string>
%|A string|
%!A string!
```
Finally, you can use the %q and %Q sequence, that are equivalent to ' and "":
```ruby
puts %q(A string)
# A string
puts %q(Now is #{Time.now})
# Now is #{Time.now}

puts %Q(A string)
# A string
puts %Q(Now is #{Time.now})
# Now is 2016-07-21 12:47:45 +0200
```
%q and %Q sequences are useful when the string contains either single quotes, double quotes, or a mix of both. In this way, you don't need to escape the content:
```ruby
%Q(<a href="/profile">User's profile<a>)
```
You can use several different delimiters, as long as there is a matching pair:
```ruby
%q(A string)
%q{A string}
%q<A string>
%q|A string|
%q!A string!
```

String interpolation
--------------------

The double-quoted delimiter " and %Q sequence supports string interpolation using #{ruby_expression}:
```ruby
puts "Now is #{Time.now}"
# Now is Now is 2016-07-21 12:47:45 +0200
puts %Q(Now is #{Time.now})
# Now is Now is 2016-07-21 12:47:45 +0200

Formatted strings
-----------------

Ruby can inject an array of values into a string by replacing any placeholders with the values from the supplied array.
```ruby
"Hello %s, my name is %s!" % ['World', 'br3nt']
# Hello World, my name is br3nt!
```
The place holders are represented by two %s and the values are supplied by the array ['Hello', 'br3nt']. The % operator instructs the string to inject the values of the array.

```

Multi-line strings
-----------------

The easiest way to create a multi-line string is to just use multiple lines between quotation marks:
```ruby
address = "Four score and seven years ago our fathers brought forth on this
continent, a new nation, conceived in Liberty, and dedicated to the
proposition that all men are created equal."
```
The main problem with that technique is that if the string includes a quotation, it'll break the string syntax. To work around the problem, you can use a heredoc instead:
```ruby
puts <<-RAVEN
  Once upon a midnight dreary, while I pondered, weak and weary, 
  Over many a quaint and curious volume of forgotten lore— 
      While I nodded, nearly napping, suddenly there came a tapping, 
  As of some one gently rapping, rapping at my chamber door. 
  "'Tis some visitor," I muttered, "tapping at my chamber door— 
              Only this and nothing more." 
  RAVEN
```
Ruby supports shell-style here documents with `<<EOT`, but the terminating text must start the line. That screws up code indentation, so there's not a lot of reason to use that style. Unfortunately, the string will have indentations depending no how the code itself is indented.

Ruby 2.3 solves the problem by introducing `<<~` which strips out excess leading spaces:

2.3
```ruby
def build_email(address)
  return (<<~EMAIL)
    TO: #{address}

    To Whom It May Concern:

    Please stop playing the bagpipes at sunrise!
                     
    Regards,
    Your neighbor               
  EMAIL
end
```
Percent Strings also work to create multiline strings:
```ruby
%q(
HAMLET        Do you see yonder cloud that's almost in shape of a camel?
POLONIUS        By the mass, and 'tis like a camel, indeed.
HAMLET        Methinks it is like a weasel.
POLONIUS        It is backed like a weasel.
HAMLET        Or like a whale?
POLONIUS        Very like a whale
)
```
There are a few ways to avoid interpolation and escape sequences:

Single quote instead of double quote: `'\n is a carriage return.'`

Lower case `q` in a percent string:` %q[#{not-a-variable}]`

Single quote the terminal string in a heredoc:
```ruby
    <<-'CODE'
       puts 'Hello world!'
    CODE

```

Accessing string elements

You can access Ruby string elements in different parts with the help of square brackets []. Within square brackets write the index or string.

Example:
```ruby
#!/usr/bin/ruby   
msg = "This tutorial is from Grey Campus." 
# "This tutorial is from Grey Campus."
puts msg["Grey Campus"]
# Grey Campus   
puts msg["tutorial"]
# tutorial
puts msg[0]
# T         
puts msg[0, 2]   .
# Th
puts msg[0..32]
# This tutorial is from Grey Campus   
puts msg[0, msg.length]
# This tutorial is from Grey Campus.
puts msg[-3]
# u
puts msg[-12..-1]
# Grey Campus.

```


Case manipulation
-----------------
```ruby
"string".upcase     # => "STRING"
"STRING".downcase   # => "string"
"String".swapcase   # => "sTRING"
"string".capitalize # => "String"
```
These four methods do not modify the original receiver. For example,
```ruby
str = "Hello"
str.upcase # => "HELLO"
puts str   # => "Hello"
```
There are four similar methods that perform the same actions but modify original receiver.
```ruby
"string".upcase!     # => "STRING"
"STRING".downcase!   # => "string"
"String".swapcase!   # => "sTRING"
"string".capitalize! # => "String"
```
For example,
```ruby
str = "Hello"
str.upcase!  # => "HELLO"
puts str     # => "HELLO"
```
**Notes: prior to Ruby 2.4 these methods do not handle unicode.**

String concatenation
--------------------

Concatenate strings with the + operator:
```ruby
s1 = "Hello"
s2 = " "
s3 = "World"

puts s1 + s2 + s3
# => Hello World

s = s1 + s2 + s3
puts s
# => Hello World
```
Or with the << operator:
```ruby
s = 'Hello'
s << ' '
s << 'World'
puts s
# => Hello World
```
Note that the << operator modifies the object on the left hand side.

You also can multiply strings, e.g.
```ruby
"wow" * 3
# => "wowwowwow"
```

Positioning strings
-------------------

In Ruby, strings can be left-justified, right-justified or centered

To left-justify string, use the ljust method. This takes in two parameters, an integer representing the number of characters of the new string and a string, representing the pattern to be filled.

If the integer is greater than the length of the original string, the new string will be left-justified with the optional string parameter taking the remaining space. If the string parameter is not given, the string will be padded with spaces.
```ruby
str ="abcd"
str.ljust(4)          => "abcd"
str.ljust(10)         => "abcd      "
```
To right-justify a string, use the rjust method. This takes in two parameters, an integer representing the number of characters of the new string and a string, representing the pattern to be filled.

If the integer is greater than the length of the original string, the new string will be right-justified with the optional string parameter taking the remaining space. If the string parameter is not given, the string will be padded with spaces.
```ruby
str = "abcd"
str.rjust(4)          => "abcd"
str.rjust(10)         => "      abcd"
```
To center a string, use the center method. This takes in two parameters, an integer representing the width of the new string and a string, which the original string will be padded with. The string will be aligned to the center.
```ruby
str = "abcd"
str.center(4)          => "abcd"
str.center(10)         => "   abcd   "
```

Multi-line strings
-----------------

The easiest way to create a multi-line string is to just use multiple lines between quotation marks:
```ruby
address = "Four score and seven years ago our fathers brought forth on this
continent, a new nation, conceived in Liberty, and dedicated to the
proposition that all men are created equal."
```
The main problem with that technique is that if the string includes a quotation, it'll break the string syntax. To work around the problem, you can use a heredoc instead:
```ruby
puts <<-RAVEN
  Once upon a midnight dreary, while I pondered, weak and weary, 
  Over many a quaint and curious volume of forgotten lore— 
      While I nodded, nearly napping, suddenly there came a tapping, 
  As of some one gently rapping, rapping at my chamber door. 
  "'Tis some visitor," I muttered, "tapping at my chamber door— 
              Only this and nothing more." 
  RAVEN
```
Ruby supports shell-style here documents with `<<EOT`, but the terminating text must start the line. That screws up code indentation, so there's not a lot of reason to use that style. Unfortunately, the string will have indentations depending no how the code itself is indented.

Ruby 2.3 solves the problem by introducing `<<~` which strips out excess leading spaces:

```ruby
def build_email(address)
  return (<<~EMAIL)
    TO: #{address}

    To Whom It May Concern:

    Please stop playing the bagpipes at sunrise!
                     
    Regards,
    Your neighbor               
  EMAIL
end
```
Percent Strings also work to create multiline strings:
```ruby
%q(
HAMLET        Do you see yonder cloud that's almost in shape of a camel?
POLONIUS        By the mass, and 'tis like a camel, indeed.
HAMLET        Methinks it is like a weasel.
POLONIUS        It is backed like a weasel.
HAMLET        Or like a whale?
POLONIUS        Very like a whale
)
```
There are a few ways to avoid interpolation and escape sequences:

Single quote instead of double quote: `'\n is a carriage return.'`

Lower case `q` in a percent string:` %q[#{not-a-variable}]`

Single quote the terminal string in a heredoc:
```ruby
    <<-'CODE'
       puts 'Hello world!'
    CODE
```
Comparing Strings

Ruby strings can be compared with three operators:

- With == operator : Returns true or false
- With eql? Operator : Returns true or false
- With casecmp method : Returns 0 if matched or 1 if not matched

Example:
```ruby
#!/usr/bin/ruby   
puts "abc" == "abc"
# true
puts "as ab" == "ab ab"   
# false
puts "23" == "32"   
false

puts "ttt".eql? "ttt"   
true
puts "12".eql? "12"   
true
      
puts "Grey".casecmp "Grey"   
# 0
puts "Grey".casecmp "grey"
# 0   
puts "Grey".casecmp "gr"  
# 1
```
