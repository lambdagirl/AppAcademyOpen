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

end
