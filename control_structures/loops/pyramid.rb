#!/usr/bin/ruby -w

puts "Enter the height of pyramid"
# reading the input from console
a = gets.chomp.to_i
i = 0
while i < a
	# printing the pyramid
	puts "#{(10**(i+1)-1)/9}"
	i = i + 1
end 