#!/usr/bin/ruby -w

# initilialising an array 
k = Array.new(6){|x| x = x + 1 }
puts "Array taken:"
# printing the array
p k
str = ""
print "Converted string :"
k.each{
	|x|
	# accesing each value of array
	str = str + x.to_s
}
# printing the output
p str