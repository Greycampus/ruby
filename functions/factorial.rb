#!/usr/bin/ruby -w

# Defining the function fact
def fact(n)						
	if n == 1 or n == 0
		# return statement passes the result of the function
		return 1
	else 
		# Recursive call of the function recursion
		return n * fact(n-1)			
	end
end

# storing the console message in variable
msg = "Enter the number" 
# printing the msg to the console
puts msg
# Reading the input from console
k = gets.chomp.to_i					
# Calling the function "fact"
puts "Factorial is #{fact(n)}"				
