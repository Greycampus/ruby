**Lambdas**
=======
```ruby
 # lambda using the arrow syntax
hello_world = -> { 'Hello World!' }
hello_world[]
# 'Hello World!'

# lambda using the arrow syntax accepting 1 argument
hello_world = ->(name) { "Hello #{name}!" }
hello_world['Sven']
# "Hello Sven!"

the_thing = lambda do |magic, ohai, dere|
  puts "magic! #{magic}"
  puts "ohai #{dere}"
  puts "#{ohai} means hello"
end

the_thing.call(1, 2, 3)
# magic! 1
# ohai 3
# 2 means hello

the_thing.call(1, 2)
# ArgumentError: wrong number of arguments (2 for 3)

the_thing[1, 2, 3, 4]
# ArgumentError: wrong number of arguments (4 for 3)
```
You can also use `->` to create and `.()` to call lambda
```ruby
the_thing = ->(magic, ohai, dere) {
  puts "magic! #{magic}"
  puts "ohai #{dere}"
  puts "#{ohai} means hello"
}

the_thing.(1, 2, 3)
# => magic! 1
# => ohai 3
# => 2 means hello
```
Here you can see that a lambda is almost the same as a proc. However, there are several caveats:

- The arity of a lambda's arguments are enforced; passing the wrong number of arguments to a lambda, will raise an `ArgumentError`. They can still have default parameters, splat parameters, etc.

- `Return`ing from within a lambda returns from the lambda, while `return`ing from a proc returns out of the enclosing scope:
```ruby
    def try_proc
      x = Proc.new {
        return # Return from try_proc
      }
      x.call
      puts "After x.call" # this line is never reached
    end

    def try_lambda
      y = -> {
        return # return from y
      }
      y.call
      puts "After y.call" # this line is not skipped
    end

    try_proc # No output
    try_lambda # Outputs "After y.call"
```

Partial Application and Currying
--------------------------------

Technically, Ruby doesn't have functions, but methods. However, a Ruby method behaves almost identically to functions in other language:
```ruby
def double(n)
  n * 2
end
```
This normal method/function takes a parameter `n`, doubles it and returns the value. Now let's define a higher order function (or method):
```ruby
def triple(n)
  lambda {3 * n}
end
```
Instead of returning a number, `triple` returns a method. You can test it using the **Interactive Ruby Shell**:
```ruby
$ irb --simple-prompt
>> def double(n)
>>   n * 2
>> end
=> :double
>> def triple(n)
>>   lambda {3 * n}
>> end
=> :triple
>> double(2)
=> 4
>> triple(2)
=> #<Proc:0x007fd07f07bdc0@(irb):7 (lambda)>
```
If you want to actually get the tripled number, you need to call (or "reduce") the lambda:
```ruby
triple_two = triple(2)
triple_two.call # => 6
```
Or more concisely:
```ruby
triple(2).call
```

Currying and Partial Applications
---------------------------------

This is not useful in terms of defining very basic functionality, but it is useful if you want to have methods/functions that are not instantly called or reduced. For example, let's say you want to define methods that add a number by a specific number (for example `add_one(2) = 3`). If you had to define a ton of these you could do:
```ruby
def add_one(n)
  n + 1
end 

def add_two(n)
  n + 2
end
```
However, you could also do this:
```ruby
add = -> (a, b) { a + b }
add_one = add.curry.(1)
add_two = add.curry.(2)
```
Using lambda calculus we can say that `add` is `(λa.(λb.(a+b)))`. Currying is a way of partially applying `add`. So `add.curry.(1)`, is `(λa.(λb.(a+b)))(1)` which can be reduced to `(λb.(1+b))`. Partial application means that we passed one argument to add but left the other argument to be supplied later. The output is a specialized method.

#### More useful examples of currying

Let's say we have really big general formula, that if we specify certain arguments to it, we can get specific formulae from it. Consider this formula:
```ruby
f(x, y, z) = sin(x\*y)*sin(y\*z)*sin(z\*x)
```
This formula is made for working in three dimensions, but let's say we only want this formula with regards to y and z. Let's also say that to ignore x, we want to set it's value to pi/2. Let's first make the general formula:
```ruby
f = ->(x, y, z) {Math.sin(x*y) * Math.sin(y*z) * Math.sin(z*x)}
```
Now, let's use currying to get our `yz` formula:
```ruby
f_yz = f.curry.(Math::PI/2)
```
Then to call the lambda stored in `f_yz`:
```ruby
f_xy.call(some_value_x, some_value_y)
```
This is pretty simple, but let's say we want to get the formula for `xz`. How can we set `y` to `Math::PI/2` if it's not the last argument? Well, it's a bit more complicated:
```ruby
f_xz = -> (x,z) {f.curry.(x, Math::PI/2, z)}
```
In this case, we need to provide placeholders for the parameter we aren't pre-filling. For consistency we could write `f_xy` like this:
```ruby
f_xy = -> (x,y) {f.curry.(x, y, Math::PI/2)}
```
Here's how the lambda calculus works for `f_yz`:
```ruby
f = (λx.(λy.(λz.(sin(x*y) * sin(y*z) * sin(z*x))))
f_yz = (λx.(λy.(λz.(sin(x*y) * sin(y*z) * sin(z*x)))) (π/2) # Reduce => 
f_yz = (λy.(λz.(sin((π/2)*y) * sin(y*z) * sin(z*(π/2))))
```
Now let's look at `f_xz`
```ruby
f = (λx.(λy.(λz.(sin(x*y) * sin(y*z) * sin(z*x))))
f_xz = (λx.(λy.(λz.(sin(x*y) * sin(y*z) * sin(z*x)))) (λt.t) (π/2)  # Reduce =>
f_xz = (λt.(λz.(sin(t*(π/2)) * sin((π/2)*z) * sin(z*t))))
```


