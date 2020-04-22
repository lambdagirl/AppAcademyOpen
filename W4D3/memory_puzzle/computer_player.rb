
# NB: The game shouldn't have to know whether a human or computer is playing. 
#Instead, it should use duck typing. This may involve writing some "dummy" methods on the HumanPlayer class. That's ok.

class ComputerPlayer

  attr_accessor :known_cards, :size
  def initialize(size)
    @previsous_guess = nil
    @known_cards = {}
    @matched_cards = {}
    @size = size
  end


  def get_user_input
    if @previous_guess
      second_guess
    else
      first_guess
    end
  end
# On its first guess, if it knows where 2 matching cards are, guess one of them, 
#otherwise guess randomly among cards it has not yet seen.
  def first_guess
    unmatch_previous || random_guess
  end

# On its second guess, if its first guess revealed a card whose value matches a known location, 
#guess that location, otherwise guess randomly among cards it has not yet seen.
  def second_guess
    match_previous || random_guess
  end

  def unmatch_previous
    (pos, _) = @known_cards.find do |pos,val|
      @known_cards.any? do |pos1,val1|
        (pos != pos1  && val == val1) && !(@matched_cards[pos] || @matched_cards[pos1])
      end
    end
  end

  def match_previous
    (pos, _) = @known_cards.find do |pos,val|
      pos != previsous_guess && val = @known_cards[previsous_guess] && @matched_cards[pos]
    end
  end

  def random_guess
    guess = nil 
    until guess && !@known_cards[guess]
      guess= [rand(size),rand(size)]
    end
    guess
  end



# Now comes the tricky part. With the HumanPlayer, we didn't need to explicitly receive the data from 
#the card we're flipping over; we just read it off the terminal output. The computer won't be quite so savvy. 
#Let's write some methods to have it accept the revealed card information from the game:

# receive_revealed_card should take in a position and the value of the card revealed at that location. 
#It should then store it in a @known_cards hash.
# receive_match should take in two positions which are a successful match. 
#I stored these in an instance variable @matched_cards
# The game should then call these methods on the player in addition to displaying the revealed cards to the terminal.

  def receive_revealed_card(pos,val)
    @known_cards[pos] = val
  end

  def receive_match(pos1,pos2)
    @matched_cards[pos1] = True
    @matched_cards[pos2] = True
  end

end