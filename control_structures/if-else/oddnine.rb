#!/usr/bin/ruby -w

puts "Enter a number"
# reading th input from console
a = gets.chomp.to_i
# In if-else the condition is checked and statemets in it are evaluated when the condition is satisfied, otherwise else is executed 
if a % 2 != 0 and a % 9 == 0 
	puts "#{a} is a odd number and a multiple of 9"
elsif a % 2 != 0 and a % 9 != 0
	puts "#{a} is a odd number but not a multiple of 9"
elsif a % 2 == 0 and a % 9 == 0
	puts "#{a} is a not odd but multiple of 9"
else
	puts "#{a} is a not odd and not a multiple of 9"
end