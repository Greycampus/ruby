#!/usr/bin/ruby -w

=begin
Ruby program to initialize a hash or dictionary with five key->value sets and print the second the key->value pair

OUTPUT
2 -> php
=end

# initialising a hash
data = Hash.new
# explicitly assiging the values
data = { 1 => "ruby" , 2 => "php", 3 => "C", 4 => "C++" , 5 => "python"}
# printing the value 
puts "#{data.keys[1]} -> #{data.values[1]}"


