#!/usr/bin/ruby -w

=begin
Ruby program to find the percentage of a student for input given in following manner

INPUT
Enter the number of students
3
Enter the students details
rag 78 56 72
teja 83 67 78
bhavana 83 75 67
Enter the name of the student
bhavana

OUTPUT
Precentage is 75.0

OUTPUT
=end


# storing the console message in variable
msg = "Enter the number of students"
# printing the msg to the console
puts msg
# reading the data from the console
a = gets.chomp.to_i
# initilising an array
marks = Array.new 
puts "Enter the students details "
while a > 0
 # reading the details of the students
 
 b = gets.chomp.split(" ")
 # Adding data to the array
 marks.push(b)
 a = a - 1
end
# storing the console message in variable
msg = "Enter the name of the student"
# printing the msg to the console
puts msg
# reading the data from the console
c = gets.chomp
# iterating the array
marks.each{
 |x|
 if x[0] == c
  total = x[1].to_i + x[2].to_i + x[3].to_i
  puts "Precentage is #{(total/3).to_f}"
 end
}
