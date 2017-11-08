class MyStack
  attr_accessor :top
  attr_accessor :lastIndex

  def initialize
    @stack = Array.new
    self.top = nil
    self.lastIndex = nil
  end

  def push(item)
    if self.lastIndex == nil
      self.lastIndex = 0
    else
      self.lastIndex += 1
    end
    @stack[self.lastIndex] = item
    self.top = item
  end

  def pop
    temp = @stack[self.lastIndex]
    if self.lastIndex == 0
      self.lastIndex = nil
      self.top = nil
    else
      self.lastIndex -= 1
      self.top = @stack[self.lastIndex]
    end
    return temp
  end

  def empty?
    if @stack.length > 0
      return false
    else
      return true
    end
  end
end
