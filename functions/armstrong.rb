#!/usr/bin/ruby -w

# user defined armstrong function
def armstrong(num)
	sum = 0
	# dup is used to store duplicate of a variable
	copy = num.dup
	while num > 0
		temp = num % 10
		num = num / 10
		# Math.log10(copy).to_i + 1 is used to find the length of the string
		sum = sum + ( temp ** (Math.log10(copy).to_i + 1) )
	end
	if copy == sum
		return true
	else
		return false
	end
end

puts "Enter a number"
# reading the input from the console
a = gets.chomp.to_i
# calling the function
if (armstrong(a))
	puts "Armstrong number"
else
	puts "Not a armstrong number"
end