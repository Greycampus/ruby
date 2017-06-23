#!/usr/bin/ruby -w

# reading required libraries
require 'set'
puts "enter list of your choice with repeatitions"
# reading the input from console
a = gets.chomp
# initilising an array
b = Array.new
b = a.split(" ")
# converting an array to set
p b.to_set
