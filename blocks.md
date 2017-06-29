**Blocks**
======

Blocks are chunks of code enclosed between braces `{}` (usually for single-line blocks) or `do..end` (used for multi-line blocks).
```ruby
5.times { puts "Hello world" } # recommended style for single line blocks

5.times do
    print "Hello "
    puts "world"
end   # recommended style for multi-line blocks

5.times {
    print "hello "
    puts "world" } # does not throw an error but is not recommended
```
**Note: braces have higher precedence than do..end**

Blocks can be used inside methods and functions using the word `yield`:
```ruby
def block_caller
    puts "some code"
    yield
    puts "other code"
end
block_caller { puts "My own block" } # the block is passed as an argument to the method.
#some code
#My own block
#other code
```

Variables
---------

Variables for blocks are local to the block (similar to the variables of functions), they die when the block is executed.
```ruby
my_variable = 8
3.times do |x|
    my_variable = x 
    puts my_variable
end
puts my_variable
#=> 0
# 1
# 2
# 8
```
Blocks can't be saved, they die once executed. In order to save blocks you need to use `procs` and `lambdas`.

