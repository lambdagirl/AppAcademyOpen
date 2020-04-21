class Board
  attr_accessor :grid, :queens
  def initialize(size =8)
    @size = size
    @grid = Array.new(size) { Array.new(size, ' ') }
    @queens =[]
  end

  def to_s
    @grid.each do |row|
        p row
    end
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val  
  end

  def place_queen(pos)
    if valid?(pos)
      row, col = pos
      @grid[row][col] = "Q"
      @queens << pos
    else
      puts "not valid"
    end
    pos
  end

  def won? 
    queens.length == 8
  end

  def valid?(pos)
    not_on_col?(pos) && not_on_row?(pos) && not_on_diagonal?(pos)
  end

  def not_on_col?(pos)
    @queens.none? { |queen| queen[1] == pos[1] }
  end

  def not_on_row?(pos)
    @queens.none? { |queen| queen[0] == pos[0] }
  end

  def not_on_diagonal?(pos)
    row, col = pos
    @queens.none? do |queen|
      queen_r = queen[0]
      queen_c = queen[1]
      (row - col) == (queen_r - queen_c) || (row - col) == (queen_c - queen_r)
    end
  end

  def solve
    
  end


end
if __FILE_ = $PROGRAM_NAME
  b = Board.new
  puts b
  puts b.place_queen([0,1])
  puts b
  puts b.queens
  puts b.place_queen([1,2])
  puts b
end