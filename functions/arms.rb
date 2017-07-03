#!/usr/bin/ruby -w

=begin
Ruby program to write function to find whether a given number is armstrong number or not

INPUT
Enter a number
370 

OUTPUT
Armstrong number
=end

# user defined armstrong function
def armstrong(num)
  sum = 0
  num.each_char{
    |x|
    sum = sum + x.to_i ** num.length
  }
  if num.to_i == sum
    return true
  else
    return false
  end
end

# storing the console message in variable
msg = "Enter a number"
# printing the msg to the console
puts msg
# reading the input from the console
a = gets.chomp
# calling the function
if (armstrong(a))
  puts "Armstrong number"
else
  puts "Not a armstrong number"
end