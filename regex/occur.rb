#!/usr/bin/ruby -w

puts "enter the string"
# reading the input from console
str = gets.chomp.to_s
copy = str.dup
# finding length of the string
l = str.length

puts "Enter the symbol to be searched"
# repacing the symbol with ''
smbl = gets.chomp
str.gsub!( smbl,"")
# printing the outputs
puts "#{smbl} occured #{l - str.length} times in #{copy}"
