#!/usr/bin/ruby -w

=begin
Ruby program to use pi value as global variable in your program to print the area of circle

INPUT
1

OUTPUT
3.14159
=end

# defining a user defined function 'glob' 
def glob()
  # GLOBAL VARIABLE (can be accessed anywhere in the entire program)
  $pi = 3.14159 
end 

# calling the method
glob()
# storing the console message in variable
msg = "Enter the radius of the circle"
# printing the msg to the console
puts msg
#reading input from console 
r = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
r = r.chomp
# to_f is used to typecast string to float
r = r.to_f
# Here the input from the console is type-casted into float using to_f
# Calculating the area of circle
area = $pi * r * r
puts "Area of circle with r #{r} is #{area}"