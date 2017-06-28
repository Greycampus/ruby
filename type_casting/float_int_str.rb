#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter a float number"
# printing the msg to the console
puts msg
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