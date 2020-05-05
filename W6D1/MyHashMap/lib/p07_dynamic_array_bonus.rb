class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable

  attr_accessor :count, :store

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if i >= self.count ||  i <= -self.count
    return self[self.count + i] if i < 0 && i > -self.count
    self.store[i % self.count ]
  end

  def []=(i, val)
    if i >= self.count ||  i < -self.count
      return nil 
    end
    if i < 0 && i > -self.count
      return self[self.count + i] = val
    end
    
    if i == self.count
      resize! if capacity == self.count
      self.count += 1
    end

    self.store[i % self.count] = val
  end

  def capacity
    self.store.length
  end

  def include?(val)
    any? { |el| el == val }
  end

  def push(val)
    if self.count == capacity
      resize!
    end
    self.store[self.count % capacity] = val
    self.count +=1
  end

  def unshift(val)	 
    resize! if self.capacity == self.count
    self.count.times { |i| self.store[self.count - i] = self.store[self.count - i - 1] }	 
    self.store[0] = val	 
    self.count += 1	  
  end

  def pop
    return nil if self.count ==0
    val = self.store[self.count-1]
    self.count -=1
    val
  end

  def shift
    return nil if self.count == 0
    val = first
    self.count.times { |i| self.store[i] = self.store[i+1] }
    pop
    val
  end

  def first
    return nil if self.count == 0
    self.store[0]
  end

  def last
    return nil if self.count == 0
    self.store[self.count-1]
  end

  def each
    self.count.times {|i| yield self.store[i]}

  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless length == other.length
    each_with_index { |el, i| return false unless el == other[i] }
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!

  new_store = StaticArray.new(capacity * 2)
  each_with_index { |el, i| new_store[i] = el }
  self.store = new_store
  end
end