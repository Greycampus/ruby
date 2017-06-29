#!/usr/bin/ruby -w

# storing the console message in variable
msg = "enter the main string"
# printing the msg to the console
puts msg
# reading the input from console
k = gets
copy = k.dup
# finding length of the string
l = k.length
puts "Enter the symbol you wish to find"
# reading the input from the console
s = gets.chomp
# gsub returns a copy of string with the all occurrences of pattern substituted for the second argument. 
k.gsub!(s,"")
# printing the output
puts "#{s} occured #{l - k.length} times in #{copy}"
