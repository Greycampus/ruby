**Methods**
=======

Functions in Ruby provide organized, reusable code to preform a set of actions. Functions simplify the coding process, prevent redundant logic, and make code easier to follow. This topic describes the declaration and utilization of functions, arguments, parameters, yield statements and scope in Ruby.

Defining a method
-----------------

Methods are defined with the `def` keyword, followed by the method name and an optional list of parameter names in parentheses. The Ruby code between `def` and `end` represents the body of the method.
```ruby
def hello(name)
  "Hello, #{name}"
end
```
A method invocation specifies the method name, the object on which it is to be invoked (sometimes called the receiver), and zero or more argument values that are assigned to the named method parameters.
```ruby
hello("World")
# => "Hello, World"
```
When the receiver is not explicit, it is `self`.

Parameter names can be used as variables within the method body, and the values of these named parameters come from the arguments to a method invocation.
```ruby
hello("World")
# => "Hello, World"
hello("All")
# => "Hello, All"
```

Default parameters
------------------

```ruby
def make_animal_sound(sound = 'Cuack')
    puts sound
end
```
```ruby
make_animal_sound('Mooo') # Mooo
make_animal_sound         # Cuack
```
It's possible to include defaults for multiple arguments:
```ruby
def make_animal_sound(sound = 'Cuack', volume = 11)
    play_sound(sound, volume)
end

make_animal_sound('Mooo') # Spinal Tap cow
```
However, it's not possible to **supply the second** without also supplying the first. Instead of using positional parameters, try keyword parameters:
```ruby
def make_animal_sound(sound: 'Cuack', volume: 11)
    play_sound(sound, volume)
end

make_animal_sound(volume: 1) # Duck whisper
```
Or a hash parameter that stores options:
```ruby
def make_animal_sound(options = {})
    options[:sound]  ||= 'Cuak'
    options[:volume] ||= 11
    play_sound(sound, volume)
end

make_animal_sound(:sound => 'Mooo') 
```
Default parameter values can be set by any ruby expression. The expression will run in the context of the method, so you can even declare local variables here.
```ruby
def make_animal_sound( sound = ( raise 'TUU-too-TUU-too...' ) ); p sound; end

make_animal_sound 'blaaaa' # => 'blaaaa'
make_animal_sound          # => TUU-too-TUU-too... (RuntimeError)
```

Use function as a block
-----------------------
Many functions in Ruby accept a block as an argument. E.g.:
```ruby
[0, 1, 2].map {|i| i + 1}
 => [1, 2, 3]
```
If you already have a function that does what you want, you can turn it into a block using &method(:fn):
```ruby
def inc(num)
   num + 1
end

[0, 1, 2].map &method(:inc)
 => [1, 2, 3]
```

Optional parameter(s) (splat operator)
--------------------------------------
```ruby
def welcome_guests(*guests)
    guests.each { |guest| puts "Welcome #{guest}!" }
end

welcome_guests('Tom')    # Welcome Tom!
welcome_guests('Rob', 'Sally', 'Lucas') # Welcome Rob!
                                        # Welcome Sally!
                                        # Welcome Lucas!
```
Note that `welcome_guests(['Rob', 'Sally', 'Lucas'])` will output `Welcome ["Rob", "Sally", "Lucas"]!`
Instead, if you have a list, you can do `welcome_guests(*['Rob', 'Sally', 'Lucas'])` and that will work as `welcome_guests('Rob', 'Sally', 'Lucas')`.


Required default optional parameter mix
---------------------------------------
```ruby
def my_mix(name,valid=true, *opt)
    puts name
    puts valid
    puts opt
end
```
Call as follows:
```ruby
my_mix('me')
# 'me'
# true
# []

my_mix('me', false)
# 'me'
# false
# []

my_mix('me', true, 5, 7) 
# 'me'
# true
# [5,7]
```

Single required parameter
-------------------------
```ruby
def say_hello_to(name)
    puts "Hello #{name}"
end

say_hello_to('Charles')    # Hello Charles
```

Tuple Arguments
---------------

A method can take an array parameter and destructure it immediately into named local variables.
```ruby
def feed( amount, (animal, food) )

    p "#{amount} #{animal}s chew some #{food}"

end

feed 3, [ 'rabbit', 'grass' ] # => "3 rabbits chew some grass"
```

Capturing undeclared keyword arguments (double splat)
-----------------------------------------------------

The `**` operator works similarly to the `*` operator but it applies to keyword parameters.
```def
def options(required_key:, optional_key: nil, **other_options)
  other_options
end

options(required_key: 'Done!', foo: 'Foo!', bar: 'Bar!')
#> { :foo => "Foo!", :bar => "Bar!" }
```
In the above example, if the `**other_options` is not used, an `ArgumentError: unknown keyword: foo, bar` error would be raised.
```ruby
def without_double_splat(required_key:, optional_key: nil)
  # do nothing
end

without_double_splat(required_key: 'Done!', foo: 'Foo!', bar: 'Bar!')
#> ArgumentError: unknown keywords: foo, bar
```
This is handy when you have a hash of options that you want to pass to a method and you do not want to filter the keys.
```ruby
def options(required_key:, optional_key: nil, **other_options)
  other_options
end

my_hash = { required_key: true, foo: 'Foo!', bar: 'Bar!' }

options(my_hash)
#> { :foo => "Foo!", :bar => "Bar!" }
```
It is also possible to unpack a hash using the ** operator. This allows you to supply keyword directly to a method in addition to values from other hashes:
```ruby
my_hash = { foo: 'Foo!', bar: 'Bar!' }

options(required_key: true, **my_hash)
#> { :foo => "Foo!", :bar => "Bar!" }

```

Method Definitions are Expressions
----------------------------------

Defining a method in Ruby 2.x returns a symbol representing the name:
```ruby
class Example
  puts def hello
  end
end

#=> :hello
```
This allows for interesting metaprogramming techniques. For instance, methods can be wrapped by other methods:
```ruby
class Class
  def logged(name)
    original_method = instance_method(name)
    define_method(name) do |*args|
      puts "Calling #{name} with #{args.inspect}."
      original_method.bind(self).call(*args)
      puts "Completed #{name}."
    end
  end
end

class Meal
  def initialize
    @food = []
  end
  
  logged def add(item)
    @food << item
  end
end

meal = Meal.new
meal.add "Coffee"
# Calling add with ["Coffee"].
# Completed add.
```

Multiple required parameters
----------------------------
```ruby
def greet(greeting, name)
    puts "#{greeting} #{name}"
end

greet('Hi', 'Sophie')    # Hi Sophie
```



