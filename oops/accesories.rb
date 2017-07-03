#!/usr/bin/ruby -w

=begin
Ruby program to Use the mobile phone class as parent and build the accessory class for a shop for biling purpose

INPUT
Enter the screensize
6
Enter RAM size
2
Enter company name
moto
enter processor speed
1.2
Earphone required (yes : 1 , no : 0)
1
Battery required (yes : 1 , no : 0)
1
Charger required (yes : 1 , no : 0)
0

OUTPUT
The price of moto mobile with accessories is nearly 28995
=end

# defining a class mobile with it's attributes 
class Mobile 
  def initialize(screensize , ram, company, processor)
    # instance variables
    @screensize = screensize
    @ram = ram
    @company = company
    @processor = processor
  end

  # class function
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

# class accessories inhering the properties of mobile
class Accessories < Mobile
  def initialize(screensize , ram, company, processor, screenguard , pouch, earphones)
    #initialising the parent class variables
    super(screensize , ram, company, processor)
    @screenguard = screenguard  
    @pouch = pouch
    @earphones = earphones

  end

  # class function
  def amount
    cost = self.price
    totalcost = @screenguard * 200 + @pouch * 300 + @earphones * 700
    puts "The price of #{@company} mobile with accessories is nearly #{(totalcost + cost).to_i}"
  end 
  
end

# reading the input from the console
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
# creating a new object
phone =  Accessories.new(a,b,c,d,e,f,g)
#calling a class fuction
phone.amount
