#!/usr/bin/ruby -w

=begin
Ruby program to append two files

OUTPUT
appended file data:
hello world!
I'm chitti, the robot
speed : 1 THz
Memory : 1 GB Get ready folks 
Happy Diwali!!!
V-2.0
=end

# Reading the file 
file1 = File.read("text.txt")               
# reading the file
file2 = File.read("text1.txt")             
# Creating a new file and adding text to it
File.write("text2.txt",file1 + file2)       
# Storing the contents of file into variable
file3 = File.read('text2.txt')             
# Printing the data of text2.txt
puts 'appended file data:'            
puts file3
