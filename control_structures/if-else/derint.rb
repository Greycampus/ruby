#!/usr/bin/ruby -w

puts "Enter the coefficients of the equation"
# reading the input from the console
a = gets.chomp
# intilizing an array
coef = Array.new
#splliting the input based on space and converting it to float simultaneously
coef = a.split(" ").map(&:to_f)
# initilising an array with values a[i] = i
mul = Array.new(coef.count){ |x| x = x }
# initilising an array
defe = Array.new
#Here the index in mul mul[-i] indicate the i'th element from last
i = 0
while i < mul.count
	#multiplying the coefficient of x and its power
	defe[i] = coef[i] * mul[-i-1]
	# incrementing the loop
	i = i + 1
end

count = defe.count - 1
#printing the differential equation
puts "Differential Equation : "

defe.each{
	|x|
	if count == 0 
		break
	else
		if count - 1 == 0
			print "%+f"%[x]
		else
			print "%+fx^#{count-1}"%[x]
		end
			
	end

	count = count - 1
}

puts ""
#intilising an array
inti = Array.new
#initilising an array and assinging it values a[x] = x + 1
mul = Array.new(coef.count){ |x| x = x + 1 }

i = 0
while i < mul.count
	# dividing the coefficient with value one greater than power
	inti[i] = coef[i] / mul[-i-1]
	# incrementing the loop
	i = i + 1
end

count = inti.count - 1
# printing the integral equation
puts "Integral Equation :"

inti.each{
	|x|
	print "%+fx^#{count+1}"%[x]
	if count == 0
		break
	end
	count = count - 1
}
print " + C"
puts ""