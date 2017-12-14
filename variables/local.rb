#!/usr/bin/ruby -w

=begin
Ruby program to use local variable take input from user and print the nearest prime power of 3.

INPUT 
4

OUTPUT
3
=end
# storing the console message in variable
message = "Enter the number"
# printing the msg to the console
puts message
#Reading the input from the console
nunber = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
number = number.chomp
#Here the input from the console is type-casted into integer using to_i
number = number.to_i
## log(a,b) : is used to calculate the find the logaritham of 'a' to the base 'b'
#floor is used to round the float into the greatest integer lesss than or equal to x
minn = Math.log(number,3).floor
#ceil is used to round the float into the smallest integer greater than or equal to x
maxx = Math.log(number,3).ceil
#checking the nearer value
## (a**b) : ** is used to calculate the a raised to the power of b 
if (number - 3**minn) <= (3**maxx - number)
  puts 3**minn
else
  puts 3**maxx
end



