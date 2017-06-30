#!/usr/bin/ruby -w

=begin
Ruby program to check whether a number is odd and multiple of 9 or not
INPUT
Enter a number
999
OUTPUT
999 is a odd number and a multiple of 9
=end
# storing the console message in variable
msg = "Enter a number"
# printing the msg to the console
puts msg
# reading th input from console
a = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
a = a.chomp
# to_i is used to typecast string to integer
a = a.to_i
# In if-else the condi
OUTPUTtion is checked and statemets in it are evaluated when the condition is satisfied, otherwise else is executed 
if a % 2 != 0 and a % 9 == 0 
	OUTPUT
	puts "#{a} is a odd n
	OUTPUTumber and a multiple of 9"
elsif a % 2 != 0 and a % 9 != 0
	puts "#{a} is a odd number but not a multiple of 9"
elsif a % 2 == 0 and a % 9 == 0
	puts "#{a} is a not odd but multiple of 9"
else
	puts "#{a} is a not odd and not a multiple of 9"
end