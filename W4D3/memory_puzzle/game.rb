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
require_relative "player"
require_relative "computer_player"

require 'colorize'

class Game
  attr_accessor :previous_guess, :board, :player
  def initialize(size, player)
    @board = Board.new(size)
    @previous_guess = nil
    @player = player
  end

  def play
    until board.won?
      board.render 
      pos = get_player_input
      make_guess(pos)
    end
    puts "You Win!"
  end

  def get_player_input
    pos = nil
    until pos && valid_pos?(pos)
      pos = player.get_user_input
    end
    pos
  end

  
  # TODO: check id it's int

  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.count == 2 
      # pos.all? { |x| x< board.size && x >=0}
  end

  def compare_guess(new_pos)
    if previous_guess
      if board[new_pos].value === board[previous_guess].value
        puts "Mached!"
      else 
        puts "Not Matching! Try again!".colorize( :background => :red)
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
    player.receive_revealed_card(pos, value)
    board.render
    compare_guess(pos)

    sleep(1)
    board.render
  end
  
end


  
if __FILE_ = $PROGRAM_NAME
  size = ARGV.empty? ? 4 : ARGV.shift.to_i

  g = Game.new(size, ComputerPlayer.new(size))
  g.play
end