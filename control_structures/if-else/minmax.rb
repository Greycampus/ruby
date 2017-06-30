#!/usr/bin/ruby -w

=begin
Ruby program to find maxima or minima of a given Quadratic equation
INPUT
Enter the coefficients of the Quadratic equation
1 2 1

OUTPUT
After Differentiation the Equation is
2.0x+2.000000 = 0
Minimum value of given equation is at x = -1.0
=end


# storing the console message in variable
msg = "Enter the coefficients of the Quadratic equation"
# printing the msg to the console
puts msg 
# reading the coefficients from console
equa = gets
# initilizing an array
coef = Array.new
# splitting the values when " " occurs and converting the values into float simultaneously
coef = equa.split(" ").map(&:to_f)
#intilizing an array
defe = Array.new
#Here the index in mul mul[-i] indicate the i'th element from last
i = 0
while i < coef.count
	defe[i] = coef[i] * (coef.length - i - 1)
	# incrementing the loop
	i = i + 1
end
#printing the differential equation
puts "After Differentiation the Equation is"
puts "#{defe[0]}x%+f = 0"%defe[1]
# printing the value 
mai = -defe[1]/defe[0]
if coef[0] > 0
	puts "Minimum value of given equation is at x = #{mai}"
else
	puts "Maximum value of given equation is at x = #{mai}"
end