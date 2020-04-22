
class Player
  attr_accessor :previsous_guess
  def initialize
    @previsous_guess = nil
  end

  def get_user_input
    prompt
    parse(STDIN.gets.chomp)
  end

  def prompt 
    puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
      print "> "
  end

  def parse(string)
    string.split(",").map { |x| Integer(x) }
  end

  
end