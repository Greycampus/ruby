#!/usr/bin/ruby -w

f = File.read("text.txt")
puts "Enter the line number to be printed"
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