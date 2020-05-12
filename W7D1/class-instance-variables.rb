class Dog1
  def initialize(name)
    @name = name
  end
  #could also use  `attr_reader :name` to generate this.
  def name
    @name
  end
end

class Dog
  def self.all
    @dogs ||= []
  end

  def initialize(name)
    @name = name

    self.Class.all << self
  end
end

class Husky < Dog
end

h = Husky.new("Rex")

Dog.all # => #<Husky:0x007f95421b5560 @name="Rex">


##Global variables `$`
##you're not likely to need to use global variables your own self.
$all_dogs = []
class Dog
  def self.all
    $all_dogs
  end

  def initialize(name)
    @name = name
    @all_dogs << self
  end
end
# [1] pry(main)> require './dog'
# => true
# [2] pry(main)> Dog.all
# NameError: undefined local variable or method `all_dogs' for Dog:Class
#         from: /Users/ruggeri/test.rb:5:in `all'
#                 from: (pry):2:in `__pry__'

def puts(*args)
  $stdout.puts(*args)
end
def gets(*args)
  $stdin.gets(*args)
end

if $stdout.isatty
  puts "I'm on a console!"
else
  puts "I'm on a file!"
end
