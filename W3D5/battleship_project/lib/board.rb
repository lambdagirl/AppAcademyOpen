class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n,:N)} 
        @size = n*n
    end

    def size 
        @size
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @grid[row][col] = val
    end

    def attack(pos)
        if self[pos] == :S
            self[pos]= :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos]= :X
            return false
        end
    end

    def place_random_ships
    end

    def hidden_ships_grid
    end

    def ::print_grid
    end

    def cheat
        
    end

    def print
    end
end
