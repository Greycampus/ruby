#!/usr/bin/ruby -w

=begin
Ruby program to solve
In physics, contact between objects during a collision leads to loss of force as no medium is perfect.
likely we are having n medium in a plane each of equal length followed by qouitient of reduction, In can be well
explained using the following example :
person throws a ball on plane from certain height h of n medium your job is to find distance traveled in plane
and the medium is repetted in cyclic order and height is only considered in integers

INPUT
Enter the total number of mediums
3
Enter the length of medium
4 
Enter the height from wich the ball is thrown
5
Enter distance travelled in each step
2
Enter quotients of loss for 2 mediums
Medium : 1
0.1
Medium : 2
0.3
Medium : 3
0.5

OUTPUT
Distance travelled by the ball is 10

EXPLAINATION
first  step 5*0.9= 4 dist = 2
second step 4*0.9= 3 dist = 4
third  step 3*0.7= 2 dist = 6
fouth  step 2*0.7= 1 dist = 8
fifth  step 1*0.5= 0 dist = 10
so,the result is 10(ten) steps
=end

puts "Enter the total number of mediums"
# reading the input from console
k = gets.chomp.to_i
puts "Enter the length of medium"
# reading the input from console
l = gets.chomp.to_i
puts "Enter the height from wich the ball is thrown"
# reading the input from console
h = gets.chomp.to_i
puts "Enter distance travelled in each step"
# reading the input from console
d = gets.chomp.to_i
puts "Enter quotients of loss for #{d} mediums"
i = 0
# initialising an array
kq = Array.new 
while i < k
  puts "Medium : #{i+1}"
  # adding the elements in the array
  kq.push(gets.chomp.to_f)
  # incrementing the loop
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
