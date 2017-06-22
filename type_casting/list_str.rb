#!/usr/bin/ruby -w

k = Array.new(6)
k = [1,2,3,4,5,6]
puts "List taken:"
p k
str = ""
print "Converted string :"
k.each{
	|x|
	str = str + x.to_s
}

p str