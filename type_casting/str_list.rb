#!/usr/bin/ruby -w

msg = "Enter the String"
puts msg
# reading the input from console
str = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
str = str.chomp
# printing the input
puts "Enterd string : #{str}"
# initilizing an array
li = Array.new
# splitting the string when an space (" ") occurs
li = str.split(' ')
puts "List generated is : "
p li