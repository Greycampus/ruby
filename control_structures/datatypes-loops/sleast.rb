#!/usr/bin/ruby -w

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

