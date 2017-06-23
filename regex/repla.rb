#!/usr/bin/ruby -w

puts "enter the string"

str = gets.chomp.to_s

puts "String before modification : #{str}"

pat = "[!*]"

while str != ""
	# storing length of initial string
	l = str.length
	# replacing the pattern
	str.gsub!(pat,"")
	# if length of string doesn't change the no change 
	if l == str.length
		break
	end

end

puts "String after modification : #{str}"