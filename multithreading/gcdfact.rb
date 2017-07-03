#!/usr/bin/ruby

# user defined function factorial
def fact(n)
   if n == 1 or n == 0
      return 1
   else 
      return n * fact(n-1)
   end
end


#user defined function for GCD
def gcd(a,b)
   while a != b
      if a > b
         return gcd(a - b,b)
      else
         return gcd(a , b - a)
      end
   end
   return a
end

puts "Enter the numbers"
# reading the input from console
a = [gets.chomp.split(" ").map(&:to_i)]
# Running a thead to calculate GCD
t1 = Thread.new{puts "G.C.D = #{gcd(a[0][0],a[0][1])}"}
# Running thread to calculate factorial
if a[0][0] > a[0][1]
   t2 = Thread.new{puts "Factorial of #{a[0][1]} : #{fact(a[0][1])}"}
else
   t2 = Thread.new{puts "Factorial of #{a[0][0]} : #{fact(a[0][0])}"}     
end
t1.join
t2.join

