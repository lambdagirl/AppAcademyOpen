require 'set'
ALPHABET = set.New("a".."z")
class Game
  attr_reader :fragment, :dictionary, :players

  def initialize(*players)
    words = File.readlines('dictionary.txt').map(&:chomp)
    @players = players
    @fragment = fragment
    @dictionary = Set.new(words)
  end

  def play_around
    fragment = ""
    take_turn

    until dictionary.include?(fragment)
      next_player!
    end
  end

  def current_player
    players.first
  end

  def previous_player
    (players.count -1).downto(0).each do |idx|
      player = players[idx]
      return player
  end

  def next_player!# update the current_player and previsou player
    players.rotate!
  end

  def take_turn(player)
    # gets a string from the player until a valid play is made; 
    #then updates the fragment and checks against the dictionary. 
    #You may also want to alert the player if they attempt to make an 
    #invalid move (or, if you're feeling mean, you might cause them to lose outright).
    s = nil
    until nil
      unless valid_play?(s)
        s = player.guess()
        fragment = fragment << s
      end
    end
  end

  def valid_play?(letter)
    #Checks that string is a letter of the alphabet and that there are 
    #words we can spell after adding it to the
    return False unless ALPHABET.include?(letter)
    dictionary.any?{|word| word.start_with?(fragment+letter)}
  end

end
