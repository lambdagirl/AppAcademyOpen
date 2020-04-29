class Dog
    #Creating getter methods for the attributes we want to expose is pretty repetitive. 
    attr_accessor :age, :name
    #attr_reader :age, :name
    def initialize(name, age, favorite_food)
      @name = name
      @age = age
      @favorite_food = favorite_food
    end
  
    # # getters
    # def name
    #   @name
    # end
  
    # def age
    #   @age
    # end
  
    # setters
    # def name=(new_name)
    #   @name = new_name
    # end
  
    # def age=(new_age)
    #   @age = new_age
    # end
  end

  dog = Dog.new("Fido", 3, "pizza")

  dog.name = "Spot"
  dog.age += 1
  
  p dog #<Dog:0x007fd87f1144a0 @age=4, @favorite_food="pizza", @name="Spot">
  
  p dog.age= 323
 
  p dog