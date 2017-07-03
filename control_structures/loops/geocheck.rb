#!/usr/bin/ruby -w

=begin
Ruby program to check whether a given number is in a goemetric progression or not for a given initial value and factor

INPUT
Enter the initial term
3
Enter the ratio in the series(only integer values)
6
Enter the number you want to check
234545

OUTPUT 
not in series
=end

# storing the console message in variable
msg = "Enter the initial term"
# printing the msg to the console
puts msg
# reading the input from console
a = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
a = a.chomp
# to_i is used to typecast string to integer
a = a.to_i
# storing the console message in variable
msg = "Enter the ratio in the series(only integer values)"
# printing the msg to the console
puts msg
# reading the input from console
r = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
r = r.chomp
# to_i is used to typecast string to integer
r = r.to_i
# storing the console message in variable
msg = "Enter the number you want to check"
# printing the msg to the console
puts msg
# reading the input from console
k = gets
# chomp method returns a new String with the given record separator removed from the end of str (if present)
k = k.chomp
# to_i is used to typecast string to integer
k = k.to_i

if k == a
  # storing the console message in variable
  msg = "You have entered the initial term again, yes its in series"
  # printing the msg to the console
  puts msg
elsif k < a
  # storing the console message in variable
  msg = "not in series"
  # printing the msg to the console
  puts msg
else
  # G.P : a , ar , ar^2 , ......., ar^p
  # here let n = a.r^p
  # iteratively divide the r^p by r
  # at some stage it must be equal to 1
  # else not in series
  k = k / a
  while k > 0
    if k < 1
      k = 0
      break
    else
      k = (k.to_f  / r)
      if k == 1
        # storing the console message in variable
        msg = "yes its in series"
        # printing the msg to the console
        puts msg 
        break
      end
    end
  end
  if k == 0
    # storing the console message in variable
    msg = "not in series"
    # printing the msg to the console
    puts msg
  end
end