#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter the n th term"
# printing the msg to the console
puts msg
# dumping the data in memory
x = Marshal.dump(Array.new(gets.chomp.to_i){ |y| y = y+1 })
puts "serialized numbers"
# retrieving the data from memory
p Marshal.load(x)