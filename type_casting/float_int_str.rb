#!/usr/bin/ruby -w

=begin
Ruby program to take float as input from user and convert it into integer and string and print it in respective manner

INPUT
2.34234

OUTPUT
The int value is : 2
Converting into String :"2.34234"

=end


# storing the console message in variable
message = "Enter a float number"
# printing the msg to the console
puts message
# gets is used to read the input from console
a = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
a = a.chomp
# to_f is used to typecast string to float
a = a.to_f
# Printing the input data
# Converting float to integer using to_i
k = a.to_i 
puts "The int value is : #{k}"
# Converting float to string using to_s
k = a.to_s
print "Converting into String :"
p k