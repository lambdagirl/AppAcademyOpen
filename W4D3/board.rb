#The Board is responsible for keeping track of all your Cards. 
#You'll want a grid instance variable to contain Cards. 
#Useful methods:

#populate should fill the board with a set of shuffled Card pairs
#render should print out a representation of the Board's current state
#won? should return true if all cards have been revealed.
#reveal should reveal a Card at guessed_pos (unless it's already face-up, in which case the method should do nothing). It should also return the value of the card it revealed (you'll see why later).

require_relative "card"
class Board
  attr_reader :grid, :size
  def initialize(size=4)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    populate
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos,val)
    row, col = pos
    grid[row][col] = val
  end
  def populate
    values = ("A".."Z").to_a
    num_pairs= size*size/2
    values = values.shuffle.take(num_pairs) * 2
    cards = values.map { |val| Card.new(TRUE,val)}
    grid.each_index do |i|
      grid[i].each_index do |j|
        self[[i,j]] = cards.pop 
      end
    end
  end

  def render
    puts "  #{(0...size).to_a.join(' ')}"
    grid.each_with_index do |row,i|
        puts "#{i} #{row.join(' ')}"
    end
  end

  def won?
    grid.all? do |row|
      row.all?(&:faceup?)
    end
  end
end



  
if __FILE_ = $PROGRAM_NAME
  b = Board.new(4)
  b.render
  require 'pry'; binding.pry
  puts b.grid.won?
end