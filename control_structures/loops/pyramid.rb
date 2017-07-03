#!/usr/bin/ruby -w

=begin
print the number pyramid of height n(input from user) using a single variable in entire program
  1
  11
  111
  1111(for n = 4)

INPUT
Enter the height of pyramid
5

OUTPUT
1
11
111
1111
11111
=end

# storing the console message in variable
msg = "Enter the height of pyramid"
# printing the msg to the console
puts msg
# reading the input from console
a = gets.chomp.to_i
i = 0
while i < a
  # printing the pyramid
  puts "#{(10**(i+1)-1)/9}"
  i = i + 1
end 