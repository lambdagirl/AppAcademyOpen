class Queue
  attr_reader :arr

  def initialize
    # create ivar to store queue here!
    @arr=[]
    
  end

  def enqueue(el)
    # adds an element to the queue
    arr.push(el)
  end

  def dequeue
    # removes one element from the stack
    arr.shift
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    arr[0]
  end
end