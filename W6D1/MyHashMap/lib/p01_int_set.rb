class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num) 
    return false if store[num]
    store[num] = true
end

  def remove(num)
    if include?(num)
      store[num] = false
    else 
      return nil
    end

  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, store.count)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end

# IntSet
# Now let's see if we can keep track of an arbitrary range of integers. Here's where it gets interesting. Create a brand new class for this one. We'll still initialize an array of a fixed length--say, 20. But now, instead of each element being true or false, they'll each be sub-arrays.

# Imagine the set as consisting of 20 buckets (the sub-arrays). When we insert an integer into this set, we'll pick one of the 20 buckets where that integer will live. That can be done easily with the modulo operator: i = n % 20.

# Using this mapping, which wraps around once every 20 integers, every integer will be deterministically assigned to a bucket. Using this concept, create your new and improved set.

# Initialize an array of size 20, with each containing item being an empty array.
# To look up a number in the set, modulo (%) the number by the set's length, and add it to the array at that index. If the integer is present in that bucket, that's how we know it's included in the set.
# You should fill out the #[] method to easily look up a bucket in the store - calling self[num] will be more DRY than @store[num % num_buckets] at every step of the way!
# Your new set should be able to keep track of an arbitrary range of integers, including negative integers. Test it out.
class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return true if store[num % num_buckets].include?(num)
    store[num % num_buckets] << num
  end

  def remove(num)
    store[num % num_buckets].delete(num)
  end

  def include?(num)
    store[num % num_buckets].include?(num)
  end

  # private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  #   @store[num % num_buckets]
  # end

  def num_buckets
    @store.length
  end
end

# ResizingIntSet
# The IntSet is okay for small sample sizes. But if the number of elements grows pretty big, our set's retrieval time depends more and more on an array scan, which is what we're trying to get away from. It's slow.

# Scanning for an item in an array (when you don't know the index) takes O(n) time, because you potentially have to look at every item. So if we're having to do an array scan on one of the 20 buckets, that bucket will have on average 1/20th of the overall items. That gives us an overall time complexity proportional to 0.05n. When you strip out the 0.05 constant factor, that's still O(n). Meh.

# Let's see if we can do better.

# Make a new class. This time, let's increase the number of buckets as the size of the set increases. 
# The goal is to have store.length > N at all times.
# You may want to implement an inspect method to make debugging easier.
# What are the time complexities of the operations of your set implementation?
class ResizingIntSet
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    self.count += 1
    resize! if num_buckets < self.count

    num
  end

  def remove(num)
    self.count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    self.store.length
  end

  def resize!
    old_store = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |num| insert(num) }
  end

  def [](num)
    self.store[num % num_buckets]
  end
end