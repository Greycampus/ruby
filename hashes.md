**Hashes**
======
A Hash is a dictionary-like collection of unique keys and their values. Also called associative arrays, they are similar to Arrays, but where an Array uses integers as its index, a Hash allows you to use any object type. You retrieve or create a new entry in a Hash by referring to its key.

Creating a hash
---------------

A hash in Ruby is an object that implements a `hash table`, mapping keys to values. Ruby supports a specific literal syntax for defining hashes using `{}`:
```ruby
my_hash = {}  # an empty hash
grades = { 'Mark' => 15, 'Jimmy' => 10, 'Jack' => 10 }
```
A hash can also be created using the standard `new` method:
```ruby
my_hash = Hash.new  # any empty hash
my_hash = {}        # any empty hash
```
Hashes can have values of any type, including complex types like arrays, objects and other hashes:
```ruby
mapping = { 'Mark' => 15, 'Jimmy' => [3,4], 'Nika' => {'a' => 3, 'b' => 5} }
mapping['Mark']   # => 15
mapping['Jimmy']  # => [3, 4]
mapping['Nika']   # => {"a"=>3, "b"=>5}
```
Also keys can be of any type, including complex ones:
```ruby
mapping = { 'Mark' => 15, 5 => 10, [1, 2] => 9 }
mapping['Mark']  # => 15
mapping[[1, 2]]  # => 9
```
`Symbols` are commonly used as hash keys, and Ruby 1.9 introduced a new syntax specifically to shorten this process. The following hashes are identical, as all keys are symbols:
```ruby
# Valid on all Ruby versions
grades = { :Mark => 15, :Jimmy => 10, :Jack => 10 }
grades = { :"Mark" => 15, :"Jimmy" => 10, :"Jack" => 10 }
```
When keys are symbols, Ruby offers a more succinct literal syntax for constructing hashes:
```ruby
# Valid in Ruby version 1.9+
grades = { Mark: 15, Jimmy: 10, Jack: 10 }
```
**Caution:** When using hash colon notation with string keys, these will be converted to symbols.
```ruby
# Valid in Ruby version 2.2+
grades = { "Mark": 15, "Jimmy": 10, "Jack": 10 }
# => { :Mark => 15, :Jimmy => 10, :Jack => 10 }
grades.has_key?("Mark") # => false
grades.has_key?(:Mark)  # => true
```
The following hash (valid in all Ruby versions) is different, because all keys are strings:
```ruby
grades = { "Mark" => 15, "Jimmy" => 10, "Jack" => 10 }
```
While both syntax versions can be mixed, the following is discouraged.
```ruby
mapping = { 'Size' => 'large', :length => 45, width: 10 }
```
Hash keys can contain spaces whether they are strings or symbols:
```
grades = { "Mark" => 15, "Jimmy Choo" => 10, :"Jack Sparrow" => 10 }
# => { "Mark" => 15, "Jimmy Choo" => 10, :"Jack Sparrow" => 10}
```


Setting Default Values
----------------------

By default, attempting to lookup the value for a key which does not exist will return `nil`. You can optionally specify some other value to return (or an action to take) when the hash is accessed with a non-existent key. Although this is referred to as "the default value", it need not be a single value; it could, for example, be a computed value such as the length of the key.

The default value of a hash can be passed to its constructor:
```ruby
h = Hash.new(0)

h[:hi] = 1
puts h[:hi]  # => 1
puts h[:bye] # => 0 returns default value instead of nil
```
A default can also be specified on an already constructed Hash:
```ruby
my_hash = { human: 2, animal: 1 }
my_hash.default = 0
my_hash[:plant] # => 0
```
It is important to note that the **default value is not copied** each time a new key is accessed, which can lead to surprising results when the default value is a reference type:
```ruby
# Use an empty array as the default value
authors = Hash.new([])

# Append a book title
authors[:homer] << 'The Odyssey'

# All new keys map to a reference to the same array:
authors[:plato] # => ['The Odyssey']
```
To circumvent this problem, the Hash constructor accepts a block which is executed each time a new key is accessed, and the returned value is used as the default:
```ruby
authors = Hash.new { [] }

# Note that we're using += instead of <<, see below
authors[:homer] += ['The Odyssey']
authors[:plato] # => []

authors # => {:homer=>["The Odyssey"]}
```
Note that above we had to use += instead of << because the default value is not automatically assigned to the hash; using << would have added to the array, but authors[:homer] would have remained undefined:
```ruby
authors[:homer] << 'The Odyssey' # ['The Odyssey']
authors[:homer] # => []
authors # => {}
```
In order to be able to assign default values on access, as well as to compute more sophisticated defaults, the default block is passed both the hash and the key:
```ruby
authors = Hash.new { |hash, key| hash[key] = [] }

authors[:homer] << 'The Odyssey'
authors[:plato] # => []

authors # => {:homer=>["The Odyssey"], :plato=>[]}
```
You can also use a default block to take an action and/or return a value dependent on the key (or some other data):
```ruby
chars = Hash.new { |hash,key| key.length }

chars[:test] # => 4
```
You can even create more complex hashes:
```ruby
page_views = Hash.new { |hash, key| hash[key] = { count: 0, url: key } }
page_views["http://example.com"][:count] += 1
page_views # => {"http://example.com"=>{:count=>1, :url=>"http://example.com"}}
```
In order to set the default to a Proc on an already-existing hash, use default_proc=:
```ruby
authors = {}
authors.default_proc = proc { [] }

authors[:homer] += ['The Odyssey']
authors[:plato] # => []

authors # {:homer=>["The Odyssey"]}
```

Accessing Values
----------------
Individual values of a hash are read and written using the `[]` and` []=` methods:
```ruby
my_hash = { length: 4, width: 5 }

my_hash[:length] #=> => 4

my_hash[:height] = 9

my_hash #=> {:length => 4, :width => 5, :height => 9 }
```
By default, accessing a key which has not been added to the hash returns `nil`, meaning it is always safe to attempt to look up a key's value:
```ruby
my_hash = {}

my_hash[:age] # => nil
```
Hashes can also contain keys in strings. If you try to access them normally it will just return a `nil`, instead you access them by their string keys:
```ruby
my_hash = { "name" => "user" }

my_hash[:name]    # => nil
my_hash["name"]   # => user
```
For situations where keys are expected or required to exist, hashes have a `fetch` method which will raise an exception when accessing a key that does not exist:
```ruby
my_hash = {}

my_hash.fetch(:age) #=> KeyError: key not found: :age
```
fetch accepts a default value as its second argument, which is returned if the key has not been previously set:

my_hash =  {}
my_hash.fetch(:age, 45) #=> => 45

`fetch` can also accept a block which is returned if the key has not been previously set:
```ruby
my_hash = {}
my_hash.fetch(:age) { 21 } #=> 21

my_hash.fetch(:age) do |k|
  puts "Could not find #{k}"
end

#=> Could not find age
```
Hashes also support a `store` method as an alias for `[]=`:
```ruby
my_hash = {}

my_hash.store(:age, 45)

my_hash #=> { :age => 45 }
```
You can also get all values of a hash using the `values` method:
```ruby
my_hash = { length: 4, width: 5 }

my_hash.values #=> [4, 5]
```
**Note: This is only for Ruby 2.3+ #dig is handy for nested Hashs. Extracts the nested value specified by the sequence of idx objects by calling dig at each step, returning nil if any intermediate step is nil.**
```ruby
h = { foo: {bar: {baz: 1}}}

h.dig(:foo, :bar, :baz)   # => 1
h.dig(:foo, :zot, :xyz)   # => nil

g = { foo: [10, 11, 12] }
g.dig(:foo, 1)            # => 11
```

iterating Over a Hash
---------------------

A `Hash` includes the `Enumerable` module, which provides several iteration methods, such as: `Enumerable#each`, `Enumerable#each_pair`, `Enumerable#each_key`, and `Enumerable#each_value`.

`.each` and `.each_pair` iterate over each key-value pair:
```ruby
h = { "first_name" => "John", "last_name" => "Doe" }
h.each do |key, value|
    puts "#{key} = #{value}"
end

# => first_name = John
#    last_name = Doe
```
`.each_key` iterates over the keys only:
```ruby
h = { "first_name" => "John", "last_name" => "Doe" }
h.each_key do |key|
  puts key
end

# => first_name
#    last_name
```
`.each_value` iterates over the values only:
```ruby
h = { "first_name" => "John", "last_name" => "Doe" }
h.each_value do |value|
    puts value
end

# => John
#    Doe
```
`.each_with_index` iterates over the elements and provides the index of the iteration:
```ruby
h = { "first_name" => "John", "last_name" => "Doe" }
h.each_with_index do |(key, value), index|
    puts "index: #{index} | key: #{key} | value: #{value}"
end

# => index: 0 | key: first_name | value: John
#    index: 1 | key: last_name | value: Doe
```

Getting all keys or values of hash
----------------------------------
```ruby
{foo: 'bar', biz: 'baz'}.keys   # => [:foo, :biz]
{foo: 'bar', biz: 'baz'}.values # => ["bar", "baz"]
{foo: 'bar', biz: 'baz'}.to_a   # => [[:foo, "bar"], [:biz, "baz"]]
{foo: 'bar', biz: 'baz'}.each   #<Enumerator: {:foo=>"bar", :biz=>"baz"}:each>
```

Overriding hash function
------------------------

Ruby hashes use the methods `hash` and `eql?` to perform the hash operation and assign objects stored in the `hash` to internal hash bins. The default implementation of hash in Ruby is the **murmur hash function over all member fields of the hashed object**. To override this behavior it is possible to override `hash` and `eql?` methods.

As with other hash implementations, two objects a and b, will be hashed to the same bucket if `a.hash == b.hash` and will be deemed identical if `a.eql?(b)`. Thus, when reimplementing hash and `eql?` one should take care to ensure that if `a` and `b` are equal under `eql?` they must return the same hash value. Otherwise this might result in duplicate entries in a hash. Conversely, a poor choice in `hash` implementation might lead many objects to share the same hash bucket, effectively destroying the O(1) look-up time and causing O(n) for calling `eql?`on all objects.

In the example below only the instance of class `A` is stored as a key, as it was added first:
```ruby
class A
  def initialize(hash_value)
    @hash_value = hash_value
  end
  def hash
    @hash_value # Return the value given externally
  end
  def eql?(b)
    self.hash == b.hash
  end
end

class B < A
end

a = A.new(1)
b = B.new(1)

h = {}
h[a] = 1
h[b] = 2

raise "error" unless h.size == 1
raise "error" unless h.include? b
raise "error" unless h.include? a
```

Modifying keys and values
-------------------------

You can create a new hash with the keys or values modified, indeed you can also add or delete keys, using **inject** (AKA, **reduce**). For example to produce a hash with stringified keys and upper case values:
```ruby
fruit = { name: 'apple', color: 'green', shape: 'round' }
# => {:name=>"apple", :color=>"green", :shape=>"round"}

new_fruit = fruit.inject({}) { |memo, (k,v)| memo[k.to_s] = v.upcase; memo }

# => new_fruit is {"name"=>"APPLE", "color"=>"GREEN", "shape"=>"ROUND"}
```
Hash is an enumerable, in essence a collection of key/value pairs. Therefore is has methods such as `each`, `map` and `inject`.

For every key/value pair in the hash the given block is evaluated, the value of memo on the first run is the seed value passed to `inject`, in our case an empty hash, `{}`. The value of `memo` for subsequent evaluations is the returned value of the previous blocks evaluation, this is why we modify `memo` by setting a key with a value and then return memo at the end. The return value of the final blocks evaluation is the return value of `inject`, in our case `memo`.

To avoid the having to provide the final value, you could use each_with_object instead:
```ruby
new_fruit = fruit.each_with_object({}) { |(k,v), memo| memo[k.to_s] = v.upcase }
```
Or even map:
```ruby
new_fruit = Hash[fruit.map{ |k,v| [k.to_s, v.upcase] }]
```
If you want the actual strings themselves to mutate in place (possibly and desirably affecting other references to the same string objects):
```ruby
# Two ways to achieve the same result (any Ruby version)
my_hash.each{ |_,str| str.gsub! /^|$/, '%' }
my_hash.each{ |_,str| str.replace "%#{str}%" }
```
If you want the hash to change in place, but you don't want to affect the strings (you want it to get new strings):
```ruby
# Two ways to achieve the same result (any Ruby version)
my_hash.each{ |key,str| my_hash[key] = "%#{str}%" }
my_hash.inject(my_hash){ |h,(k,str)| h[k]="%#{str}%"; h }
```
If you want a new hash:
```ruby
# Ruby 1.8.6+
new_hash = Hash[*my_hash.map{|k,str| [k,"%#{str}%"] }.flatten]

# Ruby 1.8.7+
new_hash = Hash[my_hash.map{|k,str| [k,"%#{str}%"] }
```

Set Operations on Hashes
------------------------
- Intersection of Hashes

	To get the intersection of two hashes, return the shared keys the values of which are equal:
```ruby
hash1 = { :a => 1, :b => 2 }
hash2 = { :b => 2, :c => 3 }
hash1.select { |k, v| (hash2.include?(k) && hash2[k] == v) } # => { :b => 2 }
```
- Union (merge) of hashes:

    keys in a hash are unique, if a key occurs in both hashes which are to be merged, the one from the hash that `merge` is called on is overwritten:
```ruby
hash1 = { :a => 1, :b => 2 }
hash2 = { :b => 4, :c => 3 }
hash1.merge(hash2) # => { :a => 1, :b => 4, :c => 3 }
hash2.merge(hash1) # => { :b => 2, :c => 3, :a => 1 }
```
