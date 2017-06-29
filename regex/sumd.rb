#!/usr/bin/ruby -w


# storing the console message in variable
msg = "enter the alphanumeric string"
# reading the input from console
puts msg
# reading the input from console
k = gets
# scanning only the numbers with instance of single digit
# scan will return all matches (may be string or regex)
sum = k.scan(/[0-9]/)
total = 0
# calculating total after type-casting into integer
sum.each{ |x| total += x.to_i}
# printing total
puts "The sum is #{total}"