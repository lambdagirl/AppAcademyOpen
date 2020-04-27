require 'rspec'
require 'hello'

#use "#method"  for 'instance' methods 
#use "::method" for 'class'    methods
describe '#hello_word' do
  it "returns 'Hello, World!'" do 
    expect(hello_word).to eq("Hello, World!")
  end 
end

#You can nest describe blocks arbitrarily deep. 
#When nesting, also consider the use of context, which is an alias for describe that can be a bit more descriptive. 
#Prefer context when it makes sense.

describe Student do 
  context 'When a current student' do
    ...
  end
  context 'When graduated' do
    ...
  end
end


#expect(test_value).to ...
#expect(test_value).to_not ...
#with an argument 
describe Interger do 
  describe '#to_s' do 
    it 'returns string representations of integers' do 
      expect(5.to_s).to eq('5')
    end
  end
end
#with a block
describe '#sqrt' do 
  it 'throw an error id given a negative number' do
    expect { sqrt(-3) }.to raise_error(ArgumentError)
  end
end

#eq -> test value
#be -> test object
expect('hello').to eq('hello') # => passes ('hello' == 'hello')
expect('hello').to be('hello') # => fails (strings are different objects)

#pending specs : leave off the do ...end from the it
describe '#valid_move?' do
  it 'should return false for wrong colored pieces'
  it 'should return false for moves that are off the board'
  it 'should return false for moves that put you in check'
end

#before
#before(:each)
#before(:all)
#One thing that we often want to do is set up the context in which our specs will run. We usually do this in a before block.
describe Chess do 
  let(:board) { Board.new }

  describe '#checkmate?' do 
    context 'when in checkmate' do
      before(:each) do 
        board.make_move([3,4],[2,3])
        board.make_move([1,2],[4,5])
        board.make_move([5,3],[5,1])
        board.make_move([6,3],[2,4])
      end

      it 'should return true' do
        expect(board.checkmate?(:black).to be true)
      end
    end
  end
end

