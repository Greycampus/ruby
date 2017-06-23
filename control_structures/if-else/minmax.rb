#!/usr/bin/ruby -w
#!/usr/bin/ruby -w

puts "Enter the coefficients of the Quadratic equation"
# reading the coefficients from console
a = gets.chomp
# initilizing an array
coef = Array.new
# splitting the values when " " occurs and converting the values into float simultaneously
coef = a.split(" ").map(&:to_f)
# initilizing an array with length of coef array and values 0..length-1
mul = Array.new(coef.count){ |x| x = x }
#intilizing an array
defe = Array.new
#Here the index in mul mul[-i] indicate the i'th element from last
i = 0
while i < mul.count
	defe[i] = coef[i] * mul[-i-1]
	# incrementing the loop
	i = i + 1
end
#printing the differential equation
puts "After Differentiation the Equation is"
puts "#{defe[0]}x%+f = 0"%defe[1]
# printing the value 
if coef[0] > 0
	puts "Minimum value of given equation is at x = #{-defe[1]/defe[0]}"
else
	puts "Maximum value of given equation is at x = #{-defe[1]/defe[0]}"
end