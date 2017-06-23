#!/usr/bin/ruby -w

# gcd is a user defined function
# Here a,b are the parameters passed to the function gcd
def gcdd(a,b)
	# max returns the maximum value of an array
	# similarly min returns the minimum value of an array
	if [a,b].max % [a,b].min == 0
		return [a,b].min
	else
		# recursive call of function gcd
		return gcdd [a,b].min,[a,b].max % [a,b].min
	end
end

puts "Enter the numbers whose G.C.D is to be found"
# read the first number
a = gets.chomp.to_i
# read the second number
b = gets.chomp.to_i
puts "G.C.D of #{a} , #{b} is #{gcdd a,b}"

