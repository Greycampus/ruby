#!/usr/bin/ruby -w

# importing required libraries
require 'set'
# storing the console message in variable
msg = "enter list of your choice with repeatitions"
# printing the msg to the console
puts msg
# gets is used to read the input from console
a = gets
# chomp method gives you back the string, but without the terminating newline
a = a.chomp
# initilising an array
b = Array.new
# split and store the data stored in 'a' when ' '(space) occurs in array 'b' 
b = a.split(" ")
# converting an array to set
c = b.to_set
# printing the set
p c
