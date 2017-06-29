#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter the number"
# printing the msg to the console
puts msg
#Reading the input from the console
n = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
n = n.chomp
#Here the input from the console is type-casted into integer using to_i
n = n.to_i
## log(a,b) : ** is used to calculate the find the logaritham of 'a' to the base 'b'
#floor is used to round the float into the greatest integer lesss than or equal to x
minn = Math.log(n,3).floor
#ceil is used to round the float into the smallest integer greater than or equal to x
maxn = Math.log(n,3).ceil
#checking the nearer value
## (a**b) : ** is used to calculate the a raised to the power of b 
if (n - 3**minn) <= (3**maxn - n)
	puts 3**minn
else
	puts 3**maxn
end



