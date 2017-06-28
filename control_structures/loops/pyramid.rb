#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter the height of pyramid"
# printing the msg to the console
puts msg
# reading the input from console
a = gets.chomp.to_i
i = 0
while i < a
	# printing the pyramid
	puts "#{(10**(i+1)-1)/9}"
	i = i + 1
end 