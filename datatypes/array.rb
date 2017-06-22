#!/usr/bin/ruby -w

puts "Enter the number of elements"
# reading the input from console
a = gets.chomp.to_i
# Initilizing an array
num = Array.new
# Reading the elements of array
puts "Enter the elements"
# Reading the elements of the array from console
while (a > 0)
	# push is used to add the elements to the array
 	num.push(gets.chomp.to_i)
 	#Decrementing the loop
	a = a - 1
end
#printing the elements of the array
puts "Elements of the array are:"
p num