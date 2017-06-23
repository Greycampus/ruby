#!/usr/bin/ruby -w

puts "enter the alphanumeric string"
# reading the input from console
str = gets.chomp.to_s
# scanning only the numbers with instance of single digit
sum = str.scan(/[0-9]/)
total = 0
# calculating total after casting into integer
sum.each{ |x| total += x.to_i}
# printing total
puts "The sum is #{total}"