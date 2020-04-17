class Room
    def initialize(number)
        @number = number
        @capacity = 3
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @occupants.length < @capacity
            return false
        end
        true
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(person)
        if full? == false
            occupants << person
            return true
        end
        occupants
        false
    end

    
end
