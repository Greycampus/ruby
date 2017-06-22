#!/usr/bin/ruby -w

puts "Enter the year"
# reading the input from the console
year = gets.chomp.to_i
# checking for the condtion
# here year % 4 == 0 && year % 100 != 0 or year % 400 must be true 
if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
	puts "#{year} is a leap year"
else 
	puts "#{year} is not a leap year"
end