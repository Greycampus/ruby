#!/usr/bin/ruby -w

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
