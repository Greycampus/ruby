#!/usr/bin/ruby -w

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