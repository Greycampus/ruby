#!/usr/bin/ruby -w

=begin
Ruby program to print the name of student having second least percentage from the given list of students  if
there are multiple students should print multiple students in alphabetical order

INPUT
Enter the number of students
5          
Enter the details of students
rag 
77
teja
89
bhavana
84
praveen
77 
bhadram
75

OUTPUT
praveen
rag

=end

# storing the console message in variable
msg = "Enter the number of students"
# printing the msg to the console
puts msg
# reading the data from the console
a = gets.chomp.to_i
# initilising an array
names = Array.new
# initilising an array
marks = Array.new
puts "Enter the details of students"
# reading the details of the students
while a > 0
 # adding data to the array
 names.push(gets.chomp)
 # adding data to the array
 marks.push(gets.chomp)
 a = a - 1
end
# zip converts any arguments to arrays, then merges elements of self with corresponding elements from each argument.
names = names.zip(marks)
# sorting the details based on percent
names.sort_by!{ |x| [ x[1] , x[0] ] }
# collecting the data based on 2nd least percentage
mark = names.collect{ |x| x[1]}.sort[2]
#printing the details
names.each{
 |x|
 if x[1] == mark
  puts x[0]
 end
}

