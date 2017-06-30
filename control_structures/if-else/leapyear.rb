#!/usr/bin/ruby -w

=begin
Ruby program to find whether the given year is leap year or not following the conditions
  The year can be evenly divided by 4, unless;
  The year can be evenly divided by 100, it is NOT a leap year, unless;
  The year is also evenly divisible by 400. Then it is a leap year.

INPUT
Enter the year
2039

OUTPUT
2039 is not a leap year

=end

# storing the console message in variable
msg = "Enter the year"
# printing the msg to the console
puts msg
# reading the input from the console
year = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
year = year.chomp
# to_i is used to typecast string to integer
year = year.to_i
# checking for the condtion
# here year % 4 == 0 && year % 100 != 0 or year % 400 must be true 
if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
	puts "#{year} is a leap year"
else 
	puts "#{year} is not a leap year"
end