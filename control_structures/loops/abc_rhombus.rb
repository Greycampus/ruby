#!/usr/bin/ruby -w

puts "Enter the Input"

# Reading the input from console
a = gets.chomp.to_i					

# Reading the input from console
n = gets.chomp.to_i					

i = 0


while i < a
	# Using center String function to pad the alphabets
	# .chr function to convert ASCII value to Alphabets 
	puts (((65+i).chr)*(2*i+1)).center(n,'-')	

	# Loop increment
	i = i + 1					
end							

i = a - 2

while i >= 0	

	# Using center String function to pad the alphabets
	# .chr function to convert ASCII value to Alphabets								 
	puts (((65+i).chr)*(2*i+1)).center(n,'-')	

	# Loop decrement
	i = i - 1					
end