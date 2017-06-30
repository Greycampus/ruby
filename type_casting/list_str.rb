#!/usr/bin/ruby -w

=begin
Ruby program to take a array of numbers and convert it into a string
OUTPUT
Array taken: [1, 2, 3, 4, 5, 6]
Converted string : "123456"
=end

# initilialising an array 
k = Array.new(6){|x| x = x + 1 }
print "Array taken: "
# printing the array
p k
string = ""
k.each{
	|x|
	# accesing each value of array
	string = string + x.to_s
}
# printing the output
print "Converted string : "
p string