#!/usr/bin/ruby -w

puts "Enter the number"
#Reading the input from the console
n = gets.chomp.to_i
#Here the input from the console is type-casted into integer using to_i
#The log function is used to fing the logaritham to the base 3
minn = Math.log(n,3).floor
#floor is used to round the float into the greatest integer lesss than or equal to x
maxn = Math.log(n,3).ceil
#ceil is used to round the float into the smallest integer greater than or equal to x

#checking the nearer value
# (a**b) : ** is used to calculate the a raised to the pover of b 
if (n - 3**minn) <= (3**maxn - n)
	puts 3**minn
else
	puts 3**maxn
end



