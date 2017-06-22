#!/usr/bin/ruby -w

puts "Enter the height of pyramid"

a = gets.chomp.to_i

i = 0

while i < a
	puts "#{(10**(i+1)-1)/9}"
	i = i + 1
end 