#!/usr/bin/ruby -w

puts "Enter the Percentage of student"
# reading the input from console
a = gets.chomp.to_i

if a > 85 # percent
	puts "GRADE - A"
elsif a > 80 and a <=85 # percent greater than 85
	puts "GRADE - A-"
elsif a > 70 and a <=80 # percent lies between 80 and 85
	puts "GRADE - B" 
elsif a > 60 and a <=70 # percent lies between 60 and 70
	puts "GRADE - C"
elsif a > 40 and a <=60 # percent lies between 40 and 60
	puts "GRADE - D"
elsif a > 35 and a <=40 # percent lies between 35 and 40
	puts "GRADE - E"
else
	puts "GRADE - E and Candidate Failed"
end
