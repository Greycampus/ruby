#!/usr/bin/ruby -w

def fact(n)							# Defining the function fact
	if n == 1 or n == 0
		return 1
	else 
		return n * fact(n-1)		# Recursive call of the function recursion
	end
end


puts "Enter the number" 

n = gets.chomp.to_i     			# Reading the input from console

puts "Factorial is #{fact(n)}"		# Calling the function "fact"