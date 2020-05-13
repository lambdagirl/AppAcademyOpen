# Notice the redundant implementations of moo/bark/meow.
module Wet
  class Animal
  end

  class Cow < Animal
    def moo
      puts "moo!"
    end
  end

  class Dog < Animal
    def bark
      puts "bark!"
    end
  end

  class Cat < Animal
    def meow
      puts "meow!"
    end
  end
end


module Dry
  class Animal
    private
    # define a `makes_noise` class method; a method that defines other
    # methods is called a *macro*
    def self.make_noise(name)
      def_method(name) do
        puts "#{name}!"
      end
      nil
    end
  end

  class Cow < Animal
    make_noise :moo
  end

  class Dog < Animal
    make_noise :bark
  end
  class Cat <Animal
    make_noise :meow
  end
  
end