#!/usr/bin/ruby -w

puts "enter the data"
# Reading the input from console
data = gets.chomp.to_s
#displaying the mail id's
data.scan(/\b[A-Z0-9.$_%+-]+@[A-Z0-9.-]+\.[A-Z]{2,3}\b/i){ |x| puts x } 