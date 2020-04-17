class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs
  #a class method
  def self.valid_pegs?(arr)
    arr.all? {|e|Code::POSSIBLE_PEGS.include?(e.upcase)}      
  end

  def initialize(pegs)
    raise "error" if !Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:upcase)
  end


end
