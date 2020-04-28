#Wrong order
RSpec.describe Deck do
  describe '#initialize' do
    it 'initializes with 52 cards' do
      subject(:deck) { Deck.new } # nope
      expect(deck.count).to eq(52)
    end
  end
end

#correct order 
RSpec.describe Deck do 
  describe  '#initialize' do
    subject(:deck) {Deck.new}
  end
  it 'initializes with 52 cards' do
    expect(deck.count).to eq(52)
  end
end

#Below is an example of RSpec written with the correct order of operations
RSpec.describe Sloth do
  subject(:sloth) {Sloth.new("Herald")}

  describe "#run" do
    context "when a valid direction is given" do
      it "returns a string that includes the direction" do
        expect(sloth.run("north")).to include("north")
      end
    end

    context "when a incorrect direction is given" do
      it "raises ArgumentError" do
        expect { sloth.run("somewhere") }.to raise_error(ArgumentError)
      end
    end
    
  end
end
