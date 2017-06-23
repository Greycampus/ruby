#!/usr/bin/ruby -w

def armstrong(num)
	sum = 0
	copy = num.dup
	while num > 0
		temp = num % 10
		num = num / 10
		sum = sum + ( temp ** (Math.log10(copy).to_i + 1) )
	end
	if copy == sum
		return true
	else
		return false
	end
end

puts "Enter a number"

a = gets.chomp.to_i

if (armstrong(a))
	puts "Armstrong number"
else
	puts "Not a armstrong number"
end