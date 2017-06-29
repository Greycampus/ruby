**Control Structures**
==================

Ruby offers the expected if and else expressions for branching logic, terminated by the end keyword:

Ruby if statement
-----------------

```ruby
age = gets.chomp.to_i   
if age >= 18   
	puts "You are eligible to vote."   
end
```  

Ruby if else
------------

Ruby if else statement tests the condition. The if block statement is executed if condition is true otherwise else block statement is executed.
```ruby 
age = gets.chomp.to_i   
if age >= 18   
	puts "You are eligible to vote."   
else   
	puts "You are not eligible to vote."   
end  
```

Ruby if else if (elsif)
-----------------------

Ruby if else if statement tests the condition. The if block statement is executed if condition is true otherwise else block statement is executed. 

```ruby
age = gets.chomp.to_i
if age > 0 and age <= 2
	puts "baby"
elsif age >= 3  and age <= 12
	puts "child"
elsif age >=13 and age <= 19
	puts "teenager"
elsif age >= 20 and age <= 60
	puts "adult"
else 
	puts "old"
end
```
Ruby ternary Statement
----------------------
In Ruby ternary statement, the if statement is shortened. First it evaluates an expression for true or false value then execute one of the statements.
```ruby
age = gets.chomp.to_i
status = (age < 18 ? true : false)
```

Ruby Case Statement
-------------------


Ruby uses the case keyword for switch statements.

As per the Ruby Docs:

- Case statements consist of an optional condition, which is in the position of an argument to case, and zero or more when clauses. The first when clause to match the condition (or to evaluate to Boolean truth, if the condition is null) “wins”, and its code stanza is executed. The value of the case statement is the value of the successful when clause, or nil if there is no such clause.
- A case statement can end with an else clause. Each when a statement can have multiple candidate values, separated by commas.

Example:
```ruby
case x
when 1,2,3
  puts "1, 2, or 3"
when 10
  puts "10"
else
  puts "Some other number"
end
```
Shorter version:
```ruby
case x
when 1,2,3 then puts "1, 2, or 3"
when 10 then puts "10"
else puts "Some other number"
end
```
The value of the case clause is matched with each when clause using the === method (not ==). Therefore it can be used with a variety of different types of objects.

A case statement can be used with Ranges:
```ruby
case 17
when 13..19
  puts "teenager"
end
```
A case statement can be used with a Regexp:
```ruby
case "google"
when /oo/
  puts "word contains oo"
end
```
A case statement can be used with a Proc or lambda:
```ruby
case 44
when -> (n) { n.even? or n < 0 }
  puts "even or less than zero"
end
```
A case statement can be used with Classes:
```ruby
case x
when Integer
  puts "It's an integer"
when String
  puts "It's a string"
end
```
By implementing the === method you can create your own match classes:
```ruby
class Empty
  def self.===(object)
    !object or "" == object
  end
end

case ""
when Empty
  puts "name was empty"
else
  puts "name is not empty"
end
```
A case statement can be used without a value to match against:
```ruby
case
when ENV['A'] == 'Y'
  puts 'A'
when ENV['B'] == 'Y'
  puts 'B'
else
  puts 'Neither A nor B'
end
```
A case statement has a value, so you can use it as a method argument or in an assignment:
```ruby
description = case 16
              when 13..19 then "teenager"
              else ""
              end
```


Truthy and Falsy values
-----------------------

In Ruby, there are exactly two values which are considered "falsy", and will return false when tested as a condition for an if expression. They are:

- nil
- boolean false

All other values are considered "truthy", including:

- numeric zero (Integer or otherwise)
- "" - Empty strings
- "\n" - Strings containing only whitespace
- [] - Empty arrays
- {} - Empty hashes

Take, for example, the following code:
```ruby
def check_truthy(var_name, var)
  is_truthy = var ? "truthy" : "falsy"
  puts "#{var_name} is #{is_truthy}"
end

check_truthy("false", false)
check_truthy("nil", nil)
check_truthy("0", 0)
check_truthy("empty string", "")
check_truthy("\\n", "\n")
check_truthy("empty array", [])
check_truthy("empty hash", {})
```
Will output:
```
false is falsy
nil is falsy
0 is truthy
empty string is truthy
\n is truthy
empty array is truthy
empty hash is truthy
```

Inline if/unless
----------------

A common pattern is to use an inline, or trailing, if or unless:
```ruby
puts "x is less than 5" if x < 5
```
This is known as a conditional modifier, and is a handy way of adding simple guard code and early returns:
```ruby
hungry = true
unless hungry
	puts "I'm learning Ruby course!"
else
	puts "Time to eat!"
end
```
It is not possible to add an else clause to these modifiers. Also it is generally not recommended to use conditional modifiers inside the main logic -- For complex code one should use normal if, elsif, else instead.

Flip-Flop operator
------------------

The flip flop operator .. is used between two conditions in a conditional statement:
```ruby
(1..5).select do |e|
  e if (e == 2) .. (e == 4)
end
# => [2, 3, 4]
```
The condition evaluates to false until the first part becomes true. Then it evaluates to true until the second part becomes true. After that it switches to false again.

This example illustrates what is being selected:
```ruby
[1, 2, 2, 3, 4, 4, 5].select do |e|
  e if (e == 2) .. (e == 4)
end
# => [2, 2, 3, 4]
```
The flip-flop operator only works inside ifs (including unless) and ternary operator. Otherwise it is being considered as the range operator.
```ruby
(1..5).select do |e|
  (e == 2) .. (e == 4)
end
# => ArgumentError: bad value for range
```
It can switch from false to true and backwards multiple times:
```ruby
((1..5).to_a * 2).select do |e|
  e if (e == 2) .. (e == 4)
end
# => [2, 3, 4, 2, 3, 4] 
```

while, until
------------

A while loop executes the block while the given condition is met:
```ruby
i = 0
while i < 5
  puts "Iteration ##{i}"
  i +=1
end
```
An until loop executes the block while the conditional is false:
```ruby
i = 0
until i == 5
  puts "Iteration ##{i}"
  i +=1
end
```

Loop control with break, next, and redo
---------------------------------------


The flow of execution of a Ruby block may be controlled with the break, next, and redo statements.

`break`
The break statement will exit the block immediately. Any remaining instructions in the block will be skipped, and the iteration will end:
```ruby
actions = %w(run jump swim exit macarena)
index = 0

while index < actions.length
  action = actions[index]

  break if action == "exit"

  index += 1
  puts "Currently doing this action: #{action}"
end

# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim
```

`next`
The next statement will return to the top of the block immediately, and proceed with the next iteration. Any remaining instructions in the block will be skipped:
```ruby
actions = %w(run jump swim rest macarena)
index = 0

while index < actions.length
  action = actions[index]
  index += 1

  next if action == "rest"

  puts "Currently doing this action: #{action}"
end

# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim
# Currently doing this action: macarena
```
`redo`
The redo statement will return to the top of the block immediately, and retry the same iteration. Any remaining instructions in the block will be skipped:
```ruby
actions = %w(run jump swim sleep macarena)
index = 0
repeat_count = 0

while index < actions.length
  action = actions[index]
  puts "Currently doing this action: #{action}"

  if action == "sleep"
    repeat_count += 1
    redo if repeat_count < 3
  end

  index += 1
end

# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim
# Currently doing this action: sleep
# Currently doing this action: sleep
# Currently doing this action: sleep
# Currently doing this action: macarena
```
`Block result values`

In both the break and next statements, a value may be provided, and will be used as a block result value:
```ruby
even_value = for value in [1, 2, 3]
  break value if value.even?
end

puts "The first even value is: #{even_value}"

# The first even value is: 2
```

return vs. next: non-local return in a block
----------------------------------------------
Consider this broken snippet:
```
def foo
  bar = [1, 2, 3, 4].map do |x|
    return 0 if x.even?
    x
  end
  puts 'baz'
  bar
end
foo # => 0
```
One might expect return to yield a value for map's array of block results. So the return value of foo would be [1, 0, 3, 0]. Instead, return returns a value from the method foo. Notice that baz isn't printed, which means execution never reached that line.

next with a value does the trick. It acts as a block-level return.
```
def foo
  bar = [1, 2, 3, 4].map do |x|
    next 0 if x.even?
    x
  end
  puts 'baz'
  bar
end
foo # baz
    # => [1, 0, 3, 0]
```
In the absence of a return, the value returned by the block is the value of its last expression.


