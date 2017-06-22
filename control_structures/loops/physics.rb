#!/usr/bin/ruby -w

puts "Enter the total number of mediums"
k = gets.chomp.to_i
puts "Enter the length of medium"
l = gets.chomp.to_i
puts "Enter the height from wich the ball is thrown"
h = gets.chomp.to_i
puts "Enter distance travelled in each step"
d = gets.chomp.to_i
puts "Enter quotients of loss for #{d} mediums"
i = 0
kq = Array.new 
while i < k
	puts "Medium : #{i+1}"
	kq.push(gets.chomp.to_f)
	i = i + 1
end

d1 = 0
while h != 0
	f1 = k * l
	i = 0
	while i < k
		if h != 0
			tt = d1 % f1
			d1 = d1 + d 	
			h = h * ( 1 - kq[(tt/l)])
			h = h.to_i
		end
			i = i + 1
	end
end

puts "Distance travelled by the ball is #{d1}"
