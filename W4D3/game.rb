#The Game should have instance variable for the Board and the previously-guessed position (if any). 
#It should also have methods for managing the Board-Player interaction.
# You may want a play loop that runs until the game is over. 
#Inside the loop, you should render the board, prompt the player for input, and get a guessed pos. 
#Pass this pos to a make_guess method, where you will handle the actual memory/matching logic. 
#Some tips on implementing this:

#If we're not already checking another Card, leave the card at guessed_pos face-up and update the previous_guess variable.
#If we are checking another card, we should compare the Card at guessed_pos with the one at previous_guess.
#If the cards match, we should leave them both face-up.
#Else, flip both cards face-down.
#In either case, reset previous_guess.
#It wouldn't be an interesting game if the player could see their previous moves. Run system("clear") before rendering the Board. This will hide any previous output from the player. sleep(n) will pause the program for n seconds. Use this method to (temporarily) show the player an incorrect guess before flipping the Cards face-down again.
require_relative "board"
class Game
  attr_accessor :previous_guess, :board
  def initialize(size)
    @board = Board.new(size)
    @previous_guess = nil
  end

  def play
    until board.won?
      board.render 
      pos = get_user_input
      make_guess(pos)
    end
    puts "You Win!"
  end

  def parse(string)
    string.split(",").map { |x| Integer(x) }
  end

  def get_user_input
    puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    print "> "
    pos = nil
    until valid_pos?(pos)
      pos = parse(STDIN.gets.chomp)
    end
    pos
  end

  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.count == 2 &&
      pos.all? { |x| x.between?(0, board.size - 1) }
  end


  def compare_guess(new_pos)
    if previous_guess
      if board[new_pos].value === board[previous_guess].value
        puts "Mached!"
      else 
        puts "Not Matching! Try again!"
        board.hide(new_pos) 
        board.hide(previous_guess)
      end
      self.previous_guess = nil
    else
      self.previous_guess = new_pos
    end
  end


  def make_guess(pos)
    value = board.reveal(pos)
    board.render
    compare_guess(pos)

    sleep(1)
    board.render
  end
  
end


  
if __FILE_ = $PROGRAM_NAME
  g = Game.new(2)
  g.play
end