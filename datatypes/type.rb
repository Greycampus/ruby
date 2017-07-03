#!/usr/bin/ruby -w

=begin
Ruby program to print the type of data

OUTPUT
1 : Integer
1.0 : Float
Grey Campus : String
=end

# explicitly assigning vales to variables 
a = 1
b = 1.0
c = "Grey Campus"
# printing class of the variables
puts "#{a} : #{a.class}"
puts "#{b} : #{b.class}"
puts "#{c} : #{c.class}"
