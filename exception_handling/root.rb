#!/usr/bin/ruby -w

class Complexroots < Exception
end

def check(d)
	if d < 0
		raise Complexroots, "Roots are imaginary so calculation stopped"
	end
end

begin
puts "Enter the equation in the form of 1 2 1 if equation is x^2 + 2x + 1:"
a = gets.chomp
temp = Array.new
temp = a.split(" ").map(&:to_f)
d = (temp[1] ** 2) - (4*temp[0]*temp[2])
check(d)
rescue Complexroots => error
	puts "#{error.message}"
	retry
else
	puts "roots are :"
	puts "#{((-temp[1]) + Math.sqrt(d))/(2*temp[0])}"
	puts "#{((-temp[1]) - Math.sqrt(d))/(2*temp[0])}"
end
