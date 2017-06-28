#!/usr/bin/ruby -w

# importing the csv library
require 'csv'
# reading the csv file seperated by , string
puts "The data in second column is : " 
CSV.foreach("read.csv", quote_char: '"', col_sep: ',', row_sep: :auto, headers: false) do |row|
	puts row[1]
end