##include method. This will take the methods defined in the module and make them available to instances.

module Greetable
  def greet
    "Hello, my name is #{self.name}"
  end
end

class Human
  include Greetable

  def initialize(name)
    @name = name
  end

  def name
    @name = name 
  end
end

class Robot
  include Greetable

  def name 
    "RObot Model #2000"
  end
end

puts r = Robot.new
puts r.greet


#Extend
#It is common to mix in a module to add instance methods to a class;
module Findable
  def objects
    @objects ||= {}
  end
  
  def find(id)
    objects[id]
  end

  def track(id,object)
    objects[id] = object
  end
end

class Cat
  extend Findable

  def initialize(name)
    @name = name   
    Cat.track(@name, self)
  end
end

puts Cat.new("Gizmo")
puts Cat.find("Gizmo")  # finds Gizmo Cat object

#Mixins vs Multiple Inheritance
#Ruby doesn't support multiple inheritance: a class can only have one parent class. 
#Ruby's answer to multiple inheritance is the ability to mix in modules. 
module Enumerable
  def map(&prc)
    results = []
    #notice how we need 'each' to write 'map'
    self.each {|el| results <<prc.call(el)}
    results
  end
  ...
end

class Array < Object 
  include Enumerable
  ...
end

class Hash < Object 
  include Enumerable
  ...
end

#namespaces
#Modules have a second, unrelated purpose: as namespaces. 
module A
  def self.make_bacon
    ...
  end
end

module B
  def self.make_bacon
    ...
  end
end

require "A"
require "B"

#two different kinds of bacon
a_grade_bacon = A.make_bacon
b_grade_bacon = B.make_bacon


#if you want to make your code widely available as a gem, you would want to wrap it in a module so as to minimize potential conflicts.
