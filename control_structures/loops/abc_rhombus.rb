#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter the number"
# printing the msg to the console
puts msg
# Reading the input from console
a = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
a = a.chomp
# to_i is used to typecast string to integer
a = a.to_i					
# storing the console message in variable
msg = "Enter the width"
puts msg
# Reading the input from console
n = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
n = n.chomp
# to_i is used to typecast string to integer
n = n.to_i					
i = 0
while i < a
	# Using center String function to pad the alphabets
	# .chr function to convert ASCII value to Alphabets 
	puts (((65+i).chr)*(2*i+1)).center(n,'-')	
	# Loop increment
	i = i + 1					
end							
i = a - 2
while i >= 0	
	# Using center String function to pad the alphabets
	# .chr function to convert ASCII value to Alphabets								 
	puts (((65+i).chr)*(2*i+1)).center(n,'-')	
	# Loop decrement
	i = i - 1					
end