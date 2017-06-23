#!/usr/bin/ruby -w

puts "Enter the number of students"
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

puts "Enter the name of the student"
# reading the data from the console
c = gets.chomp.to_s

# iterating the array
marks.each{
	|x|
	if x[0] == c
		total = x[1].to_i + x[2].to_i + x[3].to_i
		puts "Precentage of #{c} is #{total/3}"
	end
}
