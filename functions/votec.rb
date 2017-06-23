#!/usr/bin/ruby -w

# user defined function vote
def vote(a)
	i = 0
	# initialising an array
	result = Array.new
	while i < a.length
		result.push(a[i])
		i = i + 1
	end
	# uniq function is used to remove the duplicates in an array
	unique = result.uniq
	# initialising an array
	vote = Array.new
	unique.each{
		|x|
		count = 0
		result.each{
			|y|
			if x == y
				count = count + 1
			end
		}
		vote.push([x,count])
	}
	maxv = 0
	str = ""
	vote.each{
		|x|
		if x[1] >= maxv
			if x[1] > maxv
				maxv = x[1]
				str = ""
				str = str + x[0]
			else
				str = str + x[0]
			end
		end
	}
	if str.length == 1
		puts "The winner is #{str} party with #{maxv} votes"
	else
		puts "it's a tie between #{str.scan(/.{1}|.+/).join(",")}"
		puts "with hightest number of votes #{maxv}"
	end
end

puts "Enter the string"
#reading the input from the console
a = gets.chomp.to_s
# callin nthe function vote 
vote(a)