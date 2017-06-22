#!/usr/bin/ruby -w

puts "Enter the initial term"
# reading the input from console
a = gets.chomp.to_i
puts "Enter the ratio in the series(only integer values)"
# reading the input from console
r = gets.chomp.to_i
puts "Enter the number you want to check"
# reading the input from console
n = gets.chomp.to_i

if n == a
	puts "You have entered the initial term again, yes its in series"
elsif n < a
	puts "not in series"
else
	# G.P : a , ar , ar^2 , ......., ar^p
	# here let n = a.r^p
	# iteratively divide the r^p by r
	# at some stage it must be equal to 1
	# else not in series
	n = n / a
	while n > 0
		n = (n / r).to_f 
		if n == 1
			puts "yes its in series"
			break
		end
	end
	if n == 0
		puts "not in series"
	end
end