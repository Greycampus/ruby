#!/usr/bin/ruby -w

=begin
Ruby program to Use serialization for getting a series of natural numbers

INPUT
Enter the n th term
14

OUTPUT
serialized numbers
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
=end

# storing the console message in variable
msg = "Enter the n th term"
# printing the msg to the console
puts msg
# dumping the data in memory
x = Marshal.dump(Array.new(gets.chomp.to_i){ |y| y = y+1 })
puts "serialized numbers"
# retrieving the data from memory
p Marshal.load(x)