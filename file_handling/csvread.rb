#!/usr/bin/ruby -w

require 'csv'
# reading the csv file seperated by , string 
CSV.foreach("read.csv", quote_char: '"', col_sep: ',', row_sep: :auto, headers: false) do |row|
	puts row[1]
end