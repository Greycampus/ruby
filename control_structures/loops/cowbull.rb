#!/usr/bin/ruby -w

require 'io/console'

puts "Enter the secret number for the game"
# reading input from console but doesn't preview on the terminal
a = STDIN.noecho(&:gets).chomp
puts "player have three guesses for a 4 digit number.(number range 1-6)"
i = 0
while i < 3
    # reading the input from console
    temp = gets.chomp
    i = i + 1
    str = ""
    # checking whether are the two strings are same or not
    if a.eql?(temp) 
        puts "++++ you won"
        # when a break statement is encountered the control immediately exits the loop 
        break
    else
        j = 0
        # reading each character from string
        temp.each_char{
            |x|
            if x == a[j]
                str = str + "+"
            # checking whether the character is present in the string
            elsif a.include?(x)
                str = str + "-"
            else
                str = str + " "
            end    
            j = j + 1    
        }     
        puts "#{str} Have another try"  
    end
end

puts "Well Played"