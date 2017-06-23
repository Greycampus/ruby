#!/usr/bin/ruby -w

puts "Enter the number of students"
# reading the data from the console
a = gets.chomp.to_i
# initilising an array
details = Array.new

puts "Enter the details of students"
# reading the details of the students
while a > 0
	b =  gets.chomp.split(" ")
	details.push(b)
	a = a - 1
end
# sorting the details based on percent
details.sort_by!{ |x| [ x[1] , x[0] ] }
# collecting the data based on 2nd least percentage
mark = details.collect{ |x| x[1]}.sort[2]
#printing the details
details.each{
	|x|
	if x[1] == mark
		puts x[0]
	end
}

