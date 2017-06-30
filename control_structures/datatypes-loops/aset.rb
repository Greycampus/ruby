#!/usr/bin/ruby -w

=begin
Ruby program to use array as set in the program to store only unique items in a array or list
INPUT
enter list of your choice with repeatitions
1 2 3 12 3 4 56 1 3   6  1 2 3 4 5 3 1 1

OUTPUT
["1", "2", "3", "12", "4", "56", "6", "5"]
=end

# importing required libraries
require 'set'

# storing the console message in variable
msg = "enter list of your choice with repeatitions"
# printing the msg to the console
puts msg
# gets is used to read the input from console
a = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
a = a.chomp
# initilising an array
b = Array.new
# split and store the data stored in 'a' when ' '(space) occurs in array 'b' 
b = a.split(" ")
# converting an array to set
c = b.to_set.to_a
# printing the set
p c
