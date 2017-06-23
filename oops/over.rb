#!/usr/bin/ruby -w

class Person

  def welcome(msg)
	puts "A's #{msg}"
  end

end

class Indian < Person

  def welcome(msg)
	puts "B's #{msg}"
  end

end

Indian.new.welcome("hello") 
Person.new.welcome("GoodBye")