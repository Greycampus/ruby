#!/usr/bin/ruby -w

f = File.read("text.txt")

puts "Enter the line number to be printed"

a = gets.chomp.to_i

array = Array.new()

array = f.split("\n")
# puts array
if a <= array.count
	puts "#{array[a-1]}"
else
	puts "no data"
end