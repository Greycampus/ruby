#!/usr/bin/ruby -w

=begin
Ruby program to open a text file and print the nth line in text file if nth line does not exist print 'no data'

INPUT
Enter the line number to be printed
3

OUTPUT
speed : 1 THz
=end

f = File.read("text.txt")
# storing the console message in variable
msg = "Enter the line number to be printed"
# printing the msg to the console
puts msg
# reading the input from the console
a = gets.chomp.to_i
# initialising an array
array = Array.new()
# splitting the file content with newline as delimitter
array = f.split("\n")
# Printing the output
if a <= array.count
	puts "#{array[a-1]}"
else
	puts "no data"
end