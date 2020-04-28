
#subject lets us define the subject of our tests. 
#let lets us create other objecs to interact with the subject.
describe Robot do 
  subject(:robot) {Robot.new}
  let(:light_item) {double("light_item",:weight => 1)}
  let(:max_weight_item) {double("max_weight_item", :weight => 250)}

  describe "#pick_up" do 
    it "does nnot add item past maximum weight of 250" do 
      robot.pick_up(max_weight_item)

      expect do
        robot.pick_up(light_item)
      end.to raise_error(ArgumentError)
   end
  end
end

#let does not persist state
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

describe 'Cat' do 
  subject(:cat) { Cat.new("Sennacy")}

  describe "name property" do
    it "returns something we can manipulate" do
      cat.name = "Rocky"
      expect(cat.name).to eq(Rocky)
    end

    it "does not persist state" do
      expect(cat.name).to eq("Sennacy")
    end
  end
end