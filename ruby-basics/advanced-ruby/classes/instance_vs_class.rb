#Instance Methods vs Class Methods
class Dog
    def initialize(name, bark)
      @name = name
      @bark = bark
    end
  
    def speak
      @name + " says " + @bark
    end
  end
  
  my_dog = Dog.new("Fido", "woof")
  my_dog.speak          # "Fido says woof"
  
  other_dog = Dog.new("Doge", "much bork")
  other_dog.speak       # "Doge says much bork"

  # class Methods;A class method is a method that is called directly on the class.
  class Dog1
    def initialize(name, bark)
      @name = name
      @bark = bark
    end
  
    def self.growl
      "Grrrrr"
    end
  end
  
  Dog1.growl   # Grrrrr

  class Dog3
    def initialize(name, bark)
      @name = name
      @bark = bark
    end
  
    def self.whos_louder(dog_1, dog_2)
      if dog_1.bark.length > dog_2.bark.length
        return dog_1.name
      elsif dog_1.bark.length < dog_2.bark.length
        return dog_2.name
      else
        return nil
      end
    end
  
    def name
      @name
    end
  
    def bark
      @bark
    end
  end
  
  d1 = Dog3.new("Fido", "woof")
  d2 = Dog3.new("Doge", "much bork")
  p Dog3.whos_louder(d1, d2) # "Doge"