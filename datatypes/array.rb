#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter the number of elements"
# printing the msg to the console
puts msg
# reading the input from console
a = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
a = a.chomp
# to_i is used to typecast string to integer
a = a.to_i
# Initilizing an array
num = Array.new
# storing the console message in variable
msg = "Enter the elements"
puts msg
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