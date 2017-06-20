#!/usr/bin/ruby -w

file1 = File.read("text.txt")               # Reading the file 

file2 = File.read("text1.txt")              # reading the file

File.write("text2.txt",file1 + file2)       # Creating a new file and adding text to it

file3 = File.read('text2.txt')              # Storing the contents of file into variable

puts 'appended file data:'                  # Printing the data of text2.txt
puts file3
