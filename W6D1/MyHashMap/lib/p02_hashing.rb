class Integer
  # Integer#hash already implemented for you
end

# In an Array or String should be associated with its index during hashing. 
# Ex. [1, 2, 3].hash == [3, 2, 1].hash # => false
class Array
  def hash
    each_with_index.inject(0) do |sum,(x,i)| 
     (x.hash + i.hash) ^ sum
    end
  end
end
class String
  def hash
    chars.map(&:ord).hash
  end
end



# Hashes are based on sets and have no fixed order. 
# Ex. {a: 1, b: 2}.hash == {b: 2, a: 1}.hash # => true

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
