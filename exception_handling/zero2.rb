#!/usr/bin/ruby -w

class Zero2 < Exception 
end

def check(n)
		
		if n == 0
			raise Zero2, "Shouln't be divided by zero"
		end

		n = n - 1
		n = n.to_s(2)
		n.squeeze!
		
		if n == "1"
			raise Zero2, "Shouldn't be divided by Power of 2"
		end
end

	puts "division handling"
	puts "enter the numerator"
	a = gets.chomp.to_i
	puts = "enter the denominator"
	b = gets.chomp.to_i
begin
	check(b)	 
rescue Zero2 => error
	puts "#{error.message}"
else
	puts "#{a/b}"
end
