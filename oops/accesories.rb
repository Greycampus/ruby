#!/usr/bin/ruby -w

class Mobile 
	def initialize(screensize , ram, company, processor)
		@screensize = screensize
		@ram = ram
		@company = company
		@processor = processor
	end

	def price
		if (@company.downcase == 'samsung'  or @company.downcase=='moto'or @company.downcase=='lenovo' or @company.downcase=='nokia')
			if(@company.downcase=='samsung')
                ecost = 7000*(@screensize/4)+7000*(@ram)+7000*@processor+0.05*7000
            	elsif(@company.downcase=='moto')
                ecost = 5999*(@screensize/4)+5999*(@ram)+5999*@processor+0.05*5999
            	elsif(@company.downcase=='lenovo')
                ecost = 4000*(@screensize/4)+4000*(@ram)+4000*@processor+0.05*4000
            	else
                ecost = 6100*(@screensize/4)+6100*(@ram)+6100*@processor+0.05*6100
            end
            return ecost
		else
			puts "Specified company not available in our catalogue"
		end
	end
end


class Accessories < Mobile
	def initialize(screensize , ram, company, processor, screenguard , pouch, earphones)
		super(screensize , ram, company, processor)
		@screenguard = screenguard	
		@pouch = pouch
		@earphones = earphones

	end

	def amount
		cost = self.price
		totalcost = @screenguard * 200 + @pouch * 300 + @earphones * 700
		puts "The price of #{@company} mobile with accessories is nearly #{(totalcost + cost).to_i}"
	end 
	
end

puts "Enter the screensize"
a = gets.chomp.to_f
puts "Enter RAM size"
b = gets.chomp.to_f
puts "Enter company name"
c = gets.chomp
puts "enter processor speed"
d = gets.chomp.to_f
puts "Earphone required (yes : 1 , no : 0)"
e = gets.chomp.to_i
puts "Battery required (yes : 1 , no : 0)"
f = gets.chomp.to_i
puts "Charger required (yes : 1 , no : 0)"
g = gets.chomp.to_i
phone =  Accessories.new(a,b,c,d,e,f,g)
phone.amount