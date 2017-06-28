#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter the number of students"
# printing the msg to the console
puts msg
# reading the data from the console
a = gets.chomp.to_i
# initilising an array
marks = Array.new 
while a > 0
	# reading the details of the students
	puts "Enter the details of student"
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
