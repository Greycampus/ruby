#!/usr/bin/ruby -w

# reading the input from console
puts "Enter the n th term"
# dumpint the data in memory
x = Marshal.dump(Array.new(gets.chomp.to_i){ |y| y = y+1 })
puts "serialized number"
# retrieving the data from memory
p Marshal.load(x)