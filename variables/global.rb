#!/usr/bin/ruby -w

def glob()
	#GLOBAL VARIABLE (can be accessed anywhere in the entire program)
	$pi = 3.14159 
end 

#calling the method
glob()
puts "enter the radius of the circle"
#reading input from console 
radius = gets.chomp.to_f
#Here the input from the console is type-casted into float using to_f
#Calculating the area of circle
area = $pi * radius * radius
puts "Area of circle with radius #{radius} is #{area}"