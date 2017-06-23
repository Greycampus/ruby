#!/usr/bin/ruby -w

puts "Enter the secret number for the game"
a = gets.chomp
puts "player have three guesses for a 4 digit number.(number range 1-6)"
i = 0
while i < 3
    temp = gets.chomp
    i = i + 1
    str = ""
    if a.eql?(temp)
        puts "++++ you won"
        break
    else
        j = 0
        temp.each_char{
            |x|
            if x == a[j]
                str = str + "+"
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