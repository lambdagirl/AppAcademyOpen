def do_three_times(object, method_name)
  3.times {object.send(method_name)}
end

class Dog
  def bark
    puts "Woof"
  end
end

dog = Dog.new
do_three_times(dog, :bark)

#we can even defind new methods dynamically with define_method:
class Dog
  # defines a class method that will define more methods; this is
  # called a **macro**.
  def self.makes_sound(name)
    define_method(name) { puts "#{name}!"}
  end
  #exectute at the time Ruby defines the Dog class. not each time the new Dog object created
  #share by all the Dog objects, not instance-specific
  #makes_sound, knows to call the metho, because "self == Dog" here
  make_sounds(:woof)
  make_sounds(:bark)
  make_sounds(:grr)
end
dog = Dog.new
dog.woof
dog.bark
dog.grr

#some famous macro methods: 
#attr_accessor
#belongs_to/has_many


#method_missing: if not such method exists, then calls it's object#method_missing method.
class T
  def mthond_missing(*args)
    p args
  end
end
T.new.adfasdfa(:a, :b, :c) # => [:adfasdfa, :a, :b, :c]

class Cat
  def say(anything)
    puts anything
  end

  def method_missing(method_name)
    method_name = method_name.to_s
    if method_name.start_with("say_")
      text = method_name[("say_".length)..-1]

      say(text)
    else
      #do the usual thing when a method is missing( i.e., raise a error)
      super
    end
  end
end
earl = Cat.new
earl.say_hello #puts "hello"
earl.say_goodbyy #puts "goodbye"

#Hard to debug, only if you want this infinite expressability should you use method_missing; 
#prefer a macro if the user just wants to define a small set of methods.


##An Adbance Example: Dynamic Finders
#Overrode @method_missing in ActiveRecord::BASE to work for #find_by_* methods.
User.find_by_first_name_and_last_name("Ned","Ruggeri")
User.find_by_username_and_state("ruggeri","California")

#By parsing the "missing" method name and combining the column names(separated by 'and' withe the given argumentss)

class ActiveRecord::Base
  def method_missing(method_name, *args)
    method_name = method_name.to_s
    if method_name.start_with?("find_by_")
      attributes_string = method_name[("find_by_".length)-1]
      attribute_names = attributes_string.split("_and_")
      unless  attribute_names.length == args.length
        raise "unexpected # of arguments"
      end
      search_conditions = {}
      attribute_names.length.times do |i|
        search_conditions[attribute_names[i]] = args[i]
      end
    # Imagine search takes a hash of search conditions and finds
    # objects with the given properties.
      self.search(search_conditions)
    else
    #complain about the missing method
    super
    end
  end
end

# Type Introspection
"who am i".class #=>String
"who am i".is_a?(String) #=> true
Object.is_a?(Object) # => true
Object.class # => Class
Class.superclass # => Module
Class.superclass.superclass # => Object

#Methods with Varying Argument Types
perform_get("http://www.google.com/+")
perform_get(
  :scheme => :http,
  :host => "www.google.com",
  :path => "/+"
)

def  perform_get(url)
  if url.is_a?(Hash)
    # url is actually a hash of url options, call another method
    # to turn it into a string representation.
    url = make_url(url)
  end
  #...
end