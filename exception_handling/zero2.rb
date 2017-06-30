#!/usr/bin/ruby -w

=begin
Ruby program to use Exception handling to catch divided by zero and divided by power of 2 exceptions

INPUT
enter the numerator
23
enter the denominator
0

OUTPUT
Shouln't be divided by zero

INPUT
enter the numerator
100
enter the denominator
32

OUTPUT
Shouldn't be divided by Power of 2

INPUT
enter the numerator
999
enter the denominator
9

OUTPUT
111.0
=end

# user defined class
class Zero2 < Exception 
end

# user defined exception
def check(m,n)		
		if n == 0
			raise Zero2, "Shouln't be divided by zero"
		end
		n = n - 1
		# to_s(2) converts number to binary
 		n = n.to_s(2)
 		# squeeze removes the adjacent duplicates
		n.squeeze!
		if n == "1"
			raise Zero2, "Shouldn't be divided by Power of 2"
		end
end

# storing the console message in variable
msg = "enter the numerator"
# printing the msg to the console
puts msg
# reading the input from console
a = gets.chomp.to_i 	
# storing the console message in variable
msg = "enter the denominator"
# printing the msg to the console
puts msg 
# reading the input from console
b = gets.chomp.to_i
begin
	check(a,b)	 
# rescue clauses to tell Ruby the types of exceptions we want to handle
rescue Zero2 => error
	puts "#{error.message}"
else
	puts "#{a/b.to_f}"
end
