#!/usr/bin/ruby -w

=begin
Ruby program to find factorial of a number using functions

INPUT
Enter the number
10

OUTPUT
Factorial is 3628800
=end

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
n = gets.chomp.to_i          
# Calling the function "fact"
puts "Factorial is #{fact(n)}"        
