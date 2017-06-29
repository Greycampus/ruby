#!/usr/bin/ruby -w

# storing the console message in variable
msg = "Enter the coefficients of the equation"
# printing the msg to the console
puts msg
# reading the input from the console
a = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
a = a.chomp
# intilizing an array
coef = Array.new
#splliting the input based on space and converting it to float simultaneously
coef = a.split(" ").map(&:to_f)
# initilising an array
defe = Array.new
#Here the index in mul mul[-i] indicate the i'th element from last
i = 0
while i < coef.count
	#multiplying the coefficient of x and its power
	defe[i] = coef[i] * (coef.length - i - 1)
	# incrementing the loop
	i = i + 1
end

count = defe.count - 1
#printing the differential equation
puts "After Differention Equation is : "
# accessing each element of array defe
defe.each{
	|x|
	if count == 0 
		# break statements stops the execution loop and transfers the control to the next statement
		break
	else
		if count - 1 == 0
			# printing in C - langauge fashion
			print " %+f"%[x]
		else
			# printing in C - langauge fashion
			print "%+fx^#{count-1} "%[x]
		end		
	end
	count = count - 1
}

puts ""
#intilising an array
inti = Array.new
i = 0
while i < coef.count 
	# dividing the coefficient with value one greater than power
	inti[i] = coef[i] / (coef.length - i)
	# incrementing the loop
	i = i + 1
end
# initilising count to length of array inti - 1
count = inti.count - 1
# printing the integral equation
puts "After Integration the Equation is :"
# accessing each element of array inti
inti.each{
	|x|
	print "%+fx^#{count+1} "%[x]
	if count == 0
		# break statements stops the execution loop and transfers the control to the next statement
		break
	end
	count = count - 1
}
# printing the constant
print " + C "
puts ''
