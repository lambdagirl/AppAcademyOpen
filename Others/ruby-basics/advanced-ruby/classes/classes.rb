#instance Variables; #initialize @
#class Variables; @@num_wheels

class Car 
    @@num_wheels = 4

    def self.upgrade_to_flying_cars
        @@num_wheels = 0
    end

    def initialize(color)
        @color = color 
    end

    def color
        @color
    end

    def num_wheels
        @@num_wheels
    end
end
car_1 = Car.new("red")
p car_1.color

car_2 = Car.new("black")
p car_2.color
p car_2.num_wheels

Car.upgrade_to_flying_cars
p car_1.num_wheels #0

ar_3 = Car.new("silver")
p car_3.num_wheels    # 0

#class constancts;will be shared among all instances of a class, but cannot be changed