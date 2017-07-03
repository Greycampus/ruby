#!/usr/bin/ruby -w

=begin
Ruby program to take a string and convert it into list or array by using the spaces in the string as delimiter
INPUT
Enter the String
t e j a
OUTPUT
Enterd string : t e j a
List generated is : 
["t", "e", "j", "a"]
=end


message = "Enter the String"
puts message
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