#!/usr/bin/ruby -w

class Cipher
	def initialize(text)
		@text = text
	end
end

class Icipher < Cipher
	def initialize(text,shift) 
		super(text)
		@shift = shift
	end

	def encrypt
		puts "Entered plain text : #{@text}"
		str = ""
		@text.each_char{
			|x|
			temp = (x.ord - 97 + @shift)%26 + 97 
			str = str + temp.chr
		}
		puts "Cipher text is :#{str}"
	end

end

puts "Enter the text to be encrypted"
a = gets.chomp
puts "Enter shift value for ceaser cipher"
b = gets.chomp.to_i
value = Icipher.new(a,b)
value.encrypt