#Ruby TYpesTypes are really classes: Integer, String, Array, Hash, etc..
#monkey-patching - adding additional methods to an existing class

class String
    def upcase?
        self.upcase == self
    end
end
p "hello".upcase? #false

class Integer
    def prime?
        return false if self < 2

        (1...self).each do |factor|
            if self % factor == 0 
                return false
            end
        end
    true
    end
end

p 7.prime? #false

class Array
    def has_zero?
        self.include?(0)
    end
end
p [3,3,32,1,"fff"].has_zero? #false
p [3,3,32,1,"fff",0].has_zero? #true