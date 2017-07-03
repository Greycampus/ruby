#!/usr/bin/ruby -w

=begin
Ruby program to initialize a hash or dictionary with five key->value sets and print the second the key->value pair

OUTPUT
2 -> php
=end

# initialising a hash
b = Hash.new
# explicitly assiging the values
b = { 1 => "ruby" , 2 => "php", 3 => "C", 4 => "C++" , 5 => "python"}
# printing the value 
puts "#{b.keys[1]} -> #{b.values[1]}"


