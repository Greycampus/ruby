#!/usr/bin/ruby -w

puts "Enter the String"
# reading the input from cionsole
str = gets.chomp
# printing the input
puts "Enterd string :#{str}"
# initilizing an array
list = Array.new
# splitting the string when an space (" ") occurs
list = str.split(' ')
p list