#!/usr/bin/ruby -w

=begin
Ruby program to Open a text file and print all the data in it

OUTPUT
hello world!
I'm chitti, the robot
speed : 1 THz
Memory : 1 GB
=end

#reading a file
f = File.read("text.txt")
#printing the file
puts f