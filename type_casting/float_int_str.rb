#!/usr/bin/ruby -w

puts "Enter a float number"
# Reading the data from console
a = gets.chomp.to_f
# Printing the input data
puts "You have entered : #{a}"
# Converting float to integer using to_i 
puts "Converting into integer :#{a.to_i}"
# Converting float to string using to_s
print "Converting into String :"
p a.to_s