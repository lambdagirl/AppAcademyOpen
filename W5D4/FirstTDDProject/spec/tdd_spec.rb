
require 'rspec'
require 'tdd'


# Remove dups
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
describe "my_uniq" do
  let(:array) { [1, 3, 4, 1, 3, 7] }
  let(:uniqued_array) { my_uniq(array.dup) }

  it "removes duplicates" do
    array.each do |item|
      expect(uniqued_array.count(item)).to eq(1)
    end
  end

  it "only contains items from original array" do
    uniqued_array.each do |item|
      expect(array).to include(item)
    end
  end

  it "does not modify original array" do
    expect {
      my_uniq(array)
    }.to_not change{array}
  end
end

describe '##two_sum' do 

end

Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.

NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":

[-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
[0, 2] before [2, 1] (smaller first elements come first)
[0, 1] before [0, 2] (then smaller second elements come first)


  describe '#my_transpose' do 
    it 'convert row-oriented to column-oriented ' do
      arr = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      
      expect(my_transpose(arr)).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ])
  end 
end