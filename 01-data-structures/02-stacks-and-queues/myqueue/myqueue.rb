class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :lastIndex

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @lastIndex = 0
  end

  def enqueue(element)
    @queue[@lastIndex] = element
    @head = @queue[0]
    @tail = @queue[@lastIndex]
    self.lastIndex += 1
  end

  def dequeue
    @queue.delete_at(0)
  end

  def empty?
    if @queue.length > 0
      return false
    else
      return true
    end
  end
end
