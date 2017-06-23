#!/usr/bin/ruby -w

# initialising a hash
b = Hash.new
# explicitly assiging the values
b = { 1 => "ruby" , 2 => "php", 3 => "C", 4 => "C++" , 5 => "python"}
# printing the value 
puts "#{b.keys[1]} -> #{b.values[1]}"


