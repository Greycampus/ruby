#!/usr/bin/ruby -w

# Class cipher 
class Cipher
	# instance variables
	def initialize(text)
		@text = text
	end
end

# class Icipher
class Icipher < Cipher
	def initialize(text,shift)
		# initialising the parent class variables 
		super(text)
		@shift = shift
	end

	def encrypt
		puts "Entered plain text : #{@text}"
		str = ""
		@text.each_char{
			|x|
			# if value in string is alphabet
			if x =~ /[[:alpha:]]{}~|/
				# ord function is used to print the ASCII value of the character
				temp = (x.ord - 97 + @shift)%26 + 97 
				# chr function is used to convert the ASCII value to character
				str = str + temp.chr
			# if value in string is number
			elsif x =~ /\d/
				# ord function is used to print the ASCII value of the character
				temp = (x.ord - 48 + @shift)%10 + 48
				# chr function is used to convert the ASCII value to character
				str = str + temp.chr
			# if value in string is symbol
			else
				# ord function is used to print the ASCII value of the character
				temp = x.ord + @shift%26  
				# chr function is used to convert the ASCII value to character
				str = str + temp.chr
			end
		}
		puts "Cipher text is :#{str} "
	end

end

# reading the input from the console
puts "Enter the text to be encrypted"
a = gets.chomp.downcase	
puts "Enter shift value for ceaser cipher"
b = gets.chomp.to_i
# creating a new object
value = Icipher.new(a,b)
# calling a function using object
value.encrypt