#!/usr/bin/ruby -w

class Complexerror < Exception
end

def check(d)
	if d < 0
		raise Complexerror, "Roots are imaginary so calculation stopped"
	end
end

begin
# storing the console message in variable	
msg = "Enter the equation in the form of 1 2 1 if equation is x^2 + 2x + 1:"
# printing the msg to the console
puts msg
# chomp method returns a new String with the given record separator removed from the end of str (if present)
k = gets.chomp
# initialising an array
temp = Array.new
# splitting the array and type-casting it to integer
temp = k.split(" ").map(&:to_i)
d = (temp[1] ** 2) - ( 4 * temp[0] * temp[2])
check(d)
# rescue clauses to tell Ruby the types of exceptions we want to handle
rescue Complexerror => error
	puts "#{error.message}"
else
	puts "roots are :"
	puts "#{((-temp[1]) + Math.sqrt(d))/(2*temp[0])}"
	puts "#{((-temp[1]) - Math.sqrt(d))/(2*temp[0])}"
end
