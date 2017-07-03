#!/usr/bin/ruby -w

=begin
Ruby program to Extract the mail addresses in the given string using regular expression

INPUT
enter the raw data containing mail addresses
teja@gmail.comrvs@gc.comsurya@amazon.co.in

OUTPUT
Extracted email addresses are : 
teja@gmail.com
rvs@gc.com
surya@amazon.co.in
=end

# storing the console message in variable
msg = "enter the raw data containing mail addresses"
# printing the msg to the console
puts msg
# Reading the input from console
data = gets
# scan will return all matches (may be string or regex)
m = data.scan(/[A-Z0-9.$_%+-]+@[A-Z0-9.-]+\.[A-Z]{2,3}/i)
puts "Extracted email addresses are : " 
#displaying the mail id's
m.each{|x| puts x}
