#!/usr/bin/ruby -w

# Defining the function fact
def fact(n)						
	if n == 1 or n == 0
		return 1
	else 
		# Recursive call of the function recursion
		return n * fact(n-1)			
	end
end


puts "Enter the number" 

# Reading the input from console
n = gets.chomp.to_i					

# Calling the function "fact"
puts "Factorial is #{fact(n)}"				
