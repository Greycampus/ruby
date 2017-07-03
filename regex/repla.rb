#!/usr/bin/ruby -w

=begin
Ruby program to replace all the patterns like '[!*]' without using loops

INPUT
enter the string
Grey[![!*]*]Campus
String before modification : Grey[![!*]*]Campus
String after modification : GreyCampus
=end

# storing the console message in variable
msg = "enter the string"
# printing the msg to the console
puts msg
# reading th einput from console
k = gets.chomp.to_s
puts "String before modification : #{k}"
pat = "[!*]"

while k != ""
  # storing length of initial string
  l = k.length
  # gsub returns a copy of string with the all occurrences of pattern substituted for the second argument. 
  k.gsub!(pat,"")
  # if length of string doesn't change the no change 
  if l == k.length
    break
  end

end

puts "String after modification : #{k}"