#!/usr/bin/ruby -w

=begin
Ruby program to build a class to store the data of the mobile phones with screen size,ram,company and processor along with Constructor and function to estimate cost of phone based on conditions
  samsung:7000(pr)
  moto:5999
  lenovo:4000
  nokia:6100
  est cost = pr*(scr size/4.0)+pr*(ram/1.0)+pr*(proc/1.0)+0.05*pr(class)

INPUT
Enter the screensize
6
Enter RAM size
3
Enter company name
samsung
enter processoressor speed
1.2

OUTPUT
The price of samsung mobile is nearly 40250
=end

# class mobile is a user defined class
class Mobile 
  # screensize ram company processor are attributes of the mobile
  def initialize(screensize , ram, company, processor)
    # initlising the instance variables
    @screensize = screensize
    @ram = ram
    @company = company
    @processor = processor
  end

  # a class method price 
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
              puts "The price of #{@company} mobile is nearly #{ecost.to_i}"
        else
      puts "Specified company not available in our catalogue"
    end
  end
end

#reading the input from console
puts "Enter the screensize"
a = gets.chomp.to_f
puts "Enter RAM size"
b = gets.chomp.to_f
puts "Enter company name"
c = gets.chomp
puts "enter processoressor speed"
d = gets.chomp.to_f
# creating a new object for class mobile
phone = Mobile.new(a,b,c,d)
# calling a class function with an object
phone.price