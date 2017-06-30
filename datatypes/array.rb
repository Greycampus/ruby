#!/usr/bin/ruby -w

=begin
Ruby program to take input a sequence of numbers from user and store it in a array 

INPUT 
5
1
2
3
4
5

OUTPUT
Elements of the array are:
[1, 2, 3, 4, 5]
=end

# storing the console message in variable
message = "Enter the number of elements"
# printing the msg to the console
puts message
# reading the input from console
size = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
size = size.chomp
# to_i is used to typecast string to integer
size = size.to_i
# Initilizing an array
numbers = Array.new
# storing the console message in variable
message = "Enter the elements"
puts message
# Reading the elements of the array from console
while (size > 0)
	# push is used to add the elements to the array
 	numbers.push(gets.chomp.to_i)
 	#Decrementing the loop
	size = size - 1
end
#printing the elements of the array
puts "Elements of the array are:"
p numbers