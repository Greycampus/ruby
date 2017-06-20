#!/usr/bin/ruby -w

puts "Enter the Input"

a = gets.chomp.to_i								# Reading the input from console

n = gets.chomp.to_i								# Reading the input from console

i = 0

while i < a 
	puts (((65+i).chr)*(2*i+1)).center(n,'-')	# Using center String function to pad the alphabets
	i = i + 1									# .chr function to convert ASCII value to Alphabets
end												# Loop increment

i = a - 2

while i >= 0									 
	puts (((65+i).chr)*(2*i+1)).center(n,'-')	
	i = i - 1									# Loop decrement