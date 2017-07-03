#!/usr/bin/ruby -w

=begin
Ruby program to open a csv file and print only the second column in the file

OUTPUT
The data in second column is : 
31
12
45
56
63
=end

# importing the csv library
require 'csv'
# reading the csv file seperated by , string
puts "The data in second column is : " 
CSV.foreach("read.csv", quote_char: '"', col_sep: ',', row_sep: :auto, headers: false) do |row|
	puts row[1]
end