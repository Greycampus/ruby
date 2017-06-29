#!/usr/bin/ruby

# storing the console message in variable
msg = "Enter the number of terms"
# printing the msg to the console
puts msg
# reading the input from the console
n = gets.chomp.to_i
puts "Multiples of both two and three are : "
# initilising an array
arr = Array.new
# using 'upto' iterator for accessing the values upto n
1.upto(n) do |val|
	arr.push(6*val)
end
# printing the output
p arr