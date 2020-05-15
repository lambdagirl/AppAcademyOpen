require_relative 'my_stack'
class Stack_Queue
  def initialize
    inbox = MyStack.new
    outbox = MyStack.new
  end

  def size
    @inbox.size + @outbox.size
  end

  def empty?
    @inbox.empty? && @outbox.empty?
  end

  def enqueue(val)
    @inbox.push(val)
  end

  def dequeue 
   # If we haven't already reversed the stack, this runs in O(n). However, we
    # only have to do this once for every n dequeue operations, so it amortizes
    # to O(1)
    if @outbox.empty? 
        @inbox.size.times { @outbox.push(@inbox.pop) }
    end
    @outbox.pop # O(1)
end
end

# https://stackoverflow.com/questions/69192/how-to-implement-a-queue-using-two-stacks
