#!/usr/bin/ruby -w

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
