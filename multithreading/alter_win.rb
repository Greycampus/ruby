#!/usr/bin/ruby

=begin
Ruby program to use multithreading to print alternate multiples of three and two

INPUT
START
Enter the number of terms
10

OUTPUT
2
3
4
6
6
9
8
12
10
15
12
18
14
21
16
24
18
27
20
30
END
=end

# Function to print multiples of 2
def func1(n)
   i = 1 
   while i <= n
         puts "#{i*2}"
         # Sleep is used pause the execution for a specied time
         sleep(1)
         i = i+1
   end
end

# Function to print multiples of three
def func2(n)
   j = 1
   while j <= n
         puts "#{j*3}"
         # Sleep is used pause the execution for a specied time
         sleep(1)
         j = j+1
   end
end

puts "START"
puts "Enter the number of terms"
n = gets.chomp.to_i
t1 = Thread.new{func1(n)}
t2 = Thread.new{func2(n)}
t1.join
t2.join
puts "END"