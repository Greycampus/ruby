#!/usr/bin/ruby -w

require 'set'
puts "enter list of your choice with repeatitions"
a = gets.chomp
b = Array.new()
b = a.split(" ")
p b.to_set
