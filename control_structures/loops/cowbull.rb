#!/usr/bin/ruby -w

# importing the gem
require 'io/console'

# storing the console message in variable
msg = "Enter the secret number for the game"
# printing the msg to the console
puts msg
# reading input from console but doesn't preview on the terminal
sec = STDIN.noecho(&:gets)
# chomp method returns a new String with the given record separator removed from the end of str (if present)
sec = sec.chomp
msg = "player have three guesses for a 4 digit number.(number range 1-6)"
puts msg
i = 0
while i < 3
    # reading the input from console
    g = gets.chomp
    i = i + 1
    str = ""
    # checking whether are the two strings are same or not
    if sec.eql?(g) 
        puts "++++ you won"
        # when a break statement is encountered the control immediately exits the loop 
        break
    else
        j = 0
        # reading each character from string
        g.each_char{
            |x|
            if x == sec[j]
                str = str + "+"
            # checking whether the character is present in the string
            elsif sec.include?(x)
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