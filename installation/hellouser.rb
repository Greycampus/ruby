#!/usr/bin/ruby -w

=begin 
Ruby program to read name of the user and print hello user

INPUT 
Username

OUTPUT
Hello Username
=end


# storing the console message in variable
message = "what's your name ?"
# printing the msg to the console
puts message
# Reading the input from console
username = gets
# By default input is read as string unless type casted
# printing the USERNAME
puts "Hello #{username}"