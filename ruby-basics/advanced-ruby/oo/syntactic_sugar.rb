#Syntactic sugar comes in when we drop the . and (). The resulting calls are much cleaner!

class Person
    attr_reader :first_name, :last_name
  
    def initialize(first_name, last_name, age)
      @first_name = first_name
      @last_name = last_name
      @age = age
    end
  
    def ==(other_person)
      self.last_name == other_person.last_name
    end
  end
  
  person_1 = Person.new("Jane", "Doe", 20)
  person_2 = Person.new("John", "Doe", 18)
  person_3 = Person.new("John", "Wayne", 18)
  
  # Calling Person#== without any syntactic sugar is awkward:
  p person_1.==(person_2)     # true
  
  # With syntactic sugar, it's much more elegant:
  p person_1 == person_2      # true
  p person_2 == person_3      # false


class Queue
    def initialize
        @line = []
    end

    def add(num)
        @line << num
    end
    
    def remove(num)
        @line.shift
    end

    def [](position)
        @line[position]
    end

    def []=(position,ele)
        @line[position] = ele
    end
end

grocery_checkout = Queue.new

p grocery_checkout
grocery_checkout.add("dsfsd")

p grocery_checkout
grocery_checkout.add("ew")
grocery_checkout.add("dsfewesd")
grocery_checkout.add("dsfewewesd")
p grocery_checkout[2]

# Calling Queue#[] without any syntactic sugar is ugly:
grocery_checkout.[](0)         

# With syntactic sugar, it's waaaaay better:
grocery_checkout[0]             
grocery_checkout[1]    
grocery_checkout[2] = "????"  
p grocery_checkout
