#!/usr/bin/ruby -w

=begin
Ruby program to Use Function Overriding and polymorphism in a class

OUTPUT
B's hello
A's GoodBye
=end

class A

  def m1(msg)
	puts "A's #{msg}"
  end

end

class B < A

  def m1(msg)
	puts "B's #{msg}"
  end

end

# Creating objects
c = B.new
b = A.new
c.m1("hello") 
b.m1("GoodBye")