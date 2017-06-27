**Array**
=====

Create Array of Strings
-----------------------


Arrays of strings can be created using ruby's percent string syntax:
```ruby
array = %w(one two three four)
```
This is functionally equivalent to defining the array as:
```ruby
array = ['one', 'two', 'three', 'four']
```
Instead of `%w()` you may use other matching pairs of delimiters: `%w{...}`, `%w[...]`or `%w<...>`.

It is also possible to use arbitrary non-alphanumeric delimiters, such as:` %w!...!, %w#...#` or `%w@...@`.

`%W` can be used instead of `%w` to incorporate string interpolation. Consider the following:
```ruby
var = 'hello'

%w(#{var}) # => ["\#{var}"]
%W(#{var}) # => ["hello"]
```
Multiple words can be interpreted by escaping the space with a \.
```ruby
%w(Colorado California New\ York) # => ["Colorado", "California", "New York"]
```

Create Array with Array::new
----------------------------

An empty Array ([]) can be created with Array's class method, Array::new:
```ruby
Array.new    
```
To set the length of the array, pass a numerical argument:
```ruby
Array.new 3 #=> [nil, nil, nil]
```
There are two ways to populate an array with default values:

- Pass an immutable value as second argument.
- Pass a block that gets current index and generates mutable values.

```ruby
Array.new 3, :x #=> [:x, :x, :x]

Array.new(3) { |i| i.to_s } #=> ["0", "1", "2"]

a = Array.new 3, "X"            # Not recommended.
a[1].replace "C"                # a => ["C", "C", "C"]

b = Array.new(3) { "X" }        # The recommended way.
b[1].replace "C"                # b => ["X", "C", "X"]
```

Creating an Array with the literal constructor [ ]
--------------------------------------------------

Arrays can be created by enclosing a list of elements in square brackets (`[` and `]`). Array elements in this notation are separated with commas:
```ruby
array = [1, 2, 3, 4]
```
Arrays can contain any kind of objects in any combination with no restrictions on type:
```ruby
array = [1, 'b', nil, [3, 4]]
```

Manipulating Array Elements
---------------------------

Adding elements:
----------------

```ruby
[1, 2, 3] << 4
# => [1, 2, 3, 4]

[1, 2, 3].push(4)
# => [1, 2, 3, 4]

[1, 2, 3].unshift(4)
# => [4, 1, 2, 3]

[1, 2, 3] << [4, 5]
# => [1, 2, 3, [4, 5]]
```

Removing elements:
------------------

```ruby
array = [1, 2, 3, 4]
array.pop
# => 4
array
# => [1, 2, 3]

array = [1, 2, 3, 4]
array.shift
# => 1
array
# => [2, 3, 4]

array = [1, 2, 3, 4]
array.delete(1)
# => 1
array
# => [2, 3, 4]

array = [1,2,3,4,5,6]
array.delete_at(2) // delete from index 2
# => 3  
array
# => [1,2,4,5,6]


array = [1, 2, 2, 2, 3]
array - [2]
# => [1, 3]    # removed all the 2s
array - [2, 3, 4]
# => [1]       # the 4 did nothing
```

Combining arrays:
-----------------

```
[1, 2, 3] + [4, 5, 6]
# => [1, 2, 3, 4, 5, 6]

[1, 2, 3].concat([4, 5, 6])
# => [1, 2, 3, 4, 5, 6]

[1, 2, 3, 4, 5, 6] - [2, 3]
# => [1, 4, 5, 6]

[1, 2, 3] | [2, 3, 4]
# => [1, 2, 3, 4]

[1, 2, 3] & [3, 4]
# => [3]
```
You can also multiply arrays, e.g.
```ruby
[1, 2, 3] * 2
# => [1, 2, 3, 1, 2, 3]
```

Accessing elements
------------------

You can access the elements of an array by their indices. Array index numbering starts at `0`.
```ruby
%w(a b c)[0] # => 'a'
%w(a b c)[1] # => 'b'
```
You can crop an array using range
```ruby
%w(a b c d)[1..2] # => ['b', 'c'] (indexes from 1 to 2, including the 2)
%w(a b c d)[1...2] # => ['b'] (indexes from 1 to 2, excluding the 2)
```
This returns a new array, but doesn't affect the original. Ruby also supports the use of negative indices.
```ruby
%w(a b c)[-1] # => 'c'
%w(a b c)[-2] # => 'b'
```
Other useful methods

Use `first` to access the first element in an array:
```ruby
[1, 2, 3, 4].first # => 1
```
Or `first(n)` to access the first n elements returned in an array:
```ruby
[1, 2, 3, 4].first(2) # => [1, 2]
```
Similarly for `last and last(n)`:
```ruby
[1, 2, 3, 4].last    # => 4
[1, 2, 3, 4].last(2) # => [3, 4]
```
Use `sample` to access a random element in a array:
```ruby
[1, 2, 3, 4].sample  # => 3
[1, 2, 3, 4].sample  # => 1
```
Or `sample(n`):
```ruby
[1, 2, 3, 4].sample(2) # => [2, 1]
[1, 2, 3, 4].sample(2) # => [3, 4]
```


Decomposition
-------------

Any array can be quickly **decomposed** by assigning its elements into multiple variables. A simple example:
```ruby
arr = [1, 2, 3]
# ---
a = arr[0]
b = arr[1]
c = arr[2]
# --- or, the same
a, b, c = arr
```
Preceding a variable with the splat operator (`*`) puts into it an array of all the elements that haven't been captured by other variables. If none are left, empty array is assigned. Only one splat can be used in a single assignment:
```ruby
a, *b = arr       # a = 1; b = [2, 3]
a, *b, c = arr    # a = 1; b = [2]; c = 3
a, b, c, *d = arr # a = 1; b = 2; c = 3; d = []
a, *b, *c = arr   # SyntaxError: unexpected *
```
Decomposition is safe and never raises errors. `nils` are assigned where there's not enough elements, matching the behavior of `[]` operator when accessing an index out of bounds:
```ruby
arr[9000] # => nil
a, b, c, d = arr # a = 1; b = 2; c = 3; d = nil
```
Decomposition tries to call `to_ary` implicitly on the object being assigned. By implementing this method in your type you get the ability to decompose it:
```ruby
class Foo
  def to_ary
    [1, 2]
  end
end
a, b = Foo.new # a = 1; b = 2
```
If the object being decomposed doesn't `respond_to`? `to_ary`, it's treated as a single-element array:
```ruby
1.respond_to?(:to_ary) # => false
a, b = 1 # a = 1; b = nil
```
Decomposition can also be nested by using a `()`-delimited decomposition expression in place of what otherwise would be a single element:
```ruby
arr = [1, [2, 3, 4], 5, 6]
a, (b, *c), *d = arr # a = 1; b = 2; c = [3, 4]; d = [5, 6]
#   ^^^^^
```
This is effectively the opposite of splat.

Actually, any decomposition expression can be delimited by `()`. But for the first level decomposition is optional.
```ruby
a, b = [1, 2]
(a, b) = [1, 2] # the same thing
```
**Edge case:** a single identifier cannot be used as a destructuring pattern, be it outer or a nested one:
```ruby
(a) = [1] # SyntaxError
a, (b) = [1, [2]] # SyntaxError
```
When assigning an **array literal** to a destructuring expression, outer `[]` can be omitted:
```ruby
a, b = [1, 2]
a, b =  1, 2  # exactly the same
```
This is known as **parallel assignment**, but it uses the same decomposition under the hood. This is particularly handy for exchanging variables' values without employing additional temporary variables:
```ruby
t = a; a = b; b = t # an obvious way
a, b = b, a         # an idiomatic way
(a, b) = [b, a]     # ...and how it works
```
Values are captured when building the right-hand side of the assignment, so using the same variables as source and destination is relatively safe.

`#map`
---


`#map`, provided by Enumerable, creates an array by invoking a block on each element and collecting the results:
```ruby
[1, 2, 3].map { |i| i * 3 }
# => [3, 6, 9]

['1', '2', '3', '4', '5'].map { |i| i.to_i }
# => [1, 2, 3, 4, 5]
```
The original array is not modified; a new array is returned containing the transformed values in the same order as the source values.` map! `can be used if you want to modify the original array.

In `map` method you can call method or use proc to all elements in array.
```ruby
# call to_i method on all elements
%w(1 2 3 4 5 6 7 8 9 10).map(&:to_i)
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# using proc (lambda) on all elements
%w(1 2 3 4 5 6 7 8 9 10).map(&->(i){ i.to_i * 2})
# => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```
`map` is synonymous with `collect`.


Arrays and the splat (*) operator
---------------------------------


The `*`operator can be used to unpack variables and arrays so that they can be passed as individual arguments to a method.

This can be used to wrap a single object in an Array if it is not already:
```ruby
def wrap_in_array(value)
  [*value]
end

wrap_in_array(1)
#> [1]

wrap_in_array([1, 2, 3])
#> [1, 2, 3]

wrap_in_array(nil)
#> []
```
In the above example, the `wrap_in_array` method accepts one argument, `value`.

If `value` is an `Array`, its elements are unpacked and a new array is created containing those element.

If `value` is a single object, a new array is created containing that single object.

If `value` is `nil`, an empty array is returned.

The splat operator is particularly handy when used as an argument in methods in some cases. For example, it allows nil, single values and arrays to be handled in a consistent manner:
```ruby
def list(*values)
  values.each do |value|
    # do something with value
    puts value
  end
end

list(100)
#> 100

list([100, 200])
#> 100
#> 200

list(nil)
# nothing is outputted
```

Arrays union, intersection and difference
-----------------------------------------
```ruby
x = [5, 5, 1, 3]
y = [5, 2, 4, 3]
```
Union (`|`) contains elements from both arrays, with duplicates removed:
```ruby
x | y
=> [5, 1, 3, 2, 4]
```
Intersection (`&`) contains elements which are present both in first and second array:
```ruby
x & y
=> [5, 3]
```
Difference (`-`) contains elements which are present in first array and not present in second array:
```ruby
x - y
=> [1]
```

Filtering arrays
----------------

Often we want to operate only on elements of an array that fulfill a specific condition:

**`Select`**

Will return elements that match a specific condition
```ruby
array = [1, 2, 3, 4, 5, 6]
array.select { |number| number > 3 } # => [4, 5, 6]
```
**`Reject`**

Will return elements that do not match a specific condition
```ruby
array = [1, 2, 3, 4, 5, 6]
array.reject { |number| number > 3 } # => [1, 2, 3]
```
Both `#select` and `#reject`return an array, so they can be chained:
```ruby
array = [1, 2, 3, 4, 5, 6]
array.select { |number| number > 3 }.reject { |number| number < 5 }
  # => [5, 6]
```

Get all combinations / permutations of an array
-----------------------------------------------


The `permutation` method, when called with a block yields a two dimensional array consisting of all ordered sequences of a collection of numbers.

If this method is called without a block, it will return an `enumerator`. To convert to an array, call the `to_a` method.

| Example                     | Result                                            |
|-----------------------------|---------------------------------------------------|
| [1,2,3].permutation         | #<Enumerator: [1,2,3]:permutation                 |
| [1,2,3].permutation.to_a    | [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] |
| [1,2,3].permutation(2).to_a | [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]             |
| [1,2,3].permutation(4).to_a | [] -> No permutations of length 4                 |

The `combination` method on the other hand, when called with a block yields a two-dimensional array consisting of all sequences of a collection of numbers. Unlike permutation, order is disregarded in combinations. For example, `[1,2,3]` is the same as `[3,2,1]`
| Example                     | Result                            |
|-----------------------------|-----------------------------------|
| [1,2,3].combination(1)      | #<Enumerator: [1,2,3]:combination |
| [1,2,3].combination(1).to_a | [[1],[2],[3]]                     |
| [1,2,3].combination(3).to_a | [[1,2,3]]                         |
| [1,2,3].combination(4).to_a | [] -> No combinations of length 4 |

Calling the combination method by itself will result in an enumerator. To get an array, call the `to_a` method.

The `repeated_combination` and `repeated_permutation` methods are similar, except the same element can be repeated multiple times.

For example the sequences `[1,1]`, `[1,3,3,1]`, `[3,3,3]` would not be valid in regular combinations and permutations.
| Example                                     | # Combos |
|---------------------------------------------|----------|
| [1,2,3].combination(3).to_a.length          | 1        |
| [1,2,3].repeated_combination(3).to_a.length | 6        |
| [1,2,3,4,5].combination(5).to_a.length      | 1        |
| [1,2,3].repeated_combination(5).to_a.length | 126      |

Get unique array elements
-------------------------

In case you need to read an array elements `avoiding repetitions` you case use the `#uniq` method:
```ruby
a = [1, 1, 2, 3, 4, 4, 5]
a.uniq
#=> [1, 2, 3, 4, 5]
```
Instead, if you want to remove all duplicated elements from an array, you may use `#uniq!` method:
```ruby
a = [1, 1, 2, 3, 4, 4, 5]
a.uniq!
#=> [1, 2, 3, 4, 5]
```
While the output is the same, `#uniq!` also stores the new array:
```ruby
a = [1, 1, 2, 3, 4, 4, 5]
a.uniq
#=> [1, 2, 3, 4, 5]
a
#=> [1, 1, 2, 3, 4, 4, 5]

a = [1, 1, 2, 3, 4, 4, 5]
a.uniq!
#=> [1, 2, 3, 4, 5]
a
#=> [1, 2, 3, 4, 5]

```

Turn multi-dimensional array into a one-dimensional (flattened) array
---------------------------------------------------------------------
```ruby
[1, 2, [[3, 4], [5]], 6].flatten  # => [1, 2, 3, 4, 5, 6]
```
If you have a multi-dimensional array and you need to make it a simple (i.e. one-dimensional) array, you can use the #flatten method.


Two-dimensional array
---------------------

Using the `Array::new constructor`, your can initialize an array with a given size and a new array in each of its slots. The inner arrays can also be given a size and and initial value.

For instance, to create a 3x4 array of zeros:
```ruby
array = Array.new(3) { Array.new(4) { 0 } }
```
The array generated above looks like this when printed with `p`:
```ruby
[[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
```
You can read or write to elements like this:
```ruby
x = array[0][1]
array[2][3] = 2
```

Create an Array of consecutive numbers or letters
-------------------------------------------------


This can be easily accomplished by calling `Enumerable#to_a` on a `Range` object:
```ruby
(1..10).to_a    #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
`(a..b)` means that it will include all numbers between a and b. To exclude the last number, use a...b
```ruby
a_range = 1...5
a_range.to_a       #=> [1, 2, 3, 4]
```
or
```ruby
('a'..'f').to_a    #=> ["a", "b", "c", "d", "e", "f"]
('a'...'f').to_a   #=> ["a", "b", "c", "d", "e"]
```
A convenient shortcut for creating an array is `[*a..b]`
```ruby
[*1..10]           #=> [1,2,3,4,5,6,7,8,9,10]
[*'a'..'f']        #=> ["a", "b", "c", "d", "e", "f"]
```

Create Array of numbers
-----------------------

The normal way to create an array of numbers:
```ruby
numbers = [1, 2, 3, 4, 5]
```
Range objects can be used extensively to create an array of numbers:
```ruby
numbers = Array(1..10) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers = (1..10).to_a # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
`#step` and `#map` methods allow us to impose conditions on the range of numbers:
```ruby
odd_numbers = (1..10).step(2).to_a # => [1, 3, 5, 7, 9]

even_numbers = 2.step(10, 2).to_a # => [2, 4, 6, 8, 10]

squared_numbers = (1..10).map { |number| number * number } # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```
All the above methods load the numbers eagerly. If you have to load them lazily:
```
number_generator = (1..100).lazy # => #<Enumerator::Lazy: 1..100>

number_generator.first(10) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
