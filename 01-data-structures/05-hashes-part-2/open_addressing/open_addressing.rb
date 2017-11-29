require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    @number = index(key, size)
    if @items[@number] != nil
      decide = next_open_index(@number)
      if decide != -1
        @items[decide] = [decide, key, value]
      else
        resize
        @number = index(key, size)
        decide = next_open_index(@number)
        @items[decide] = [decide, key, value]
      end
    else
      @items[@number] = [@number, key, value]
    end
  end

  def [](key)
    @items.each do |item|
      if item == nil
        next
      end
      if item[1] == key
        return item[2]
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0

   key.split("").each do |char|
     if char.ord == 0
       next
     end

     sum = sum + char.ord
   end


   sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    currentIndex = index
    (size-1).times do
      currentIndex += 1
      if currentIndex == size
        currentIndex = 0
        if @items[currentIndex] != nil
          next
        else
          return currentIndex
        end
      else
        if @items[currentIndex] != nil
          next
        else
          return currentIndex
        end
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    last = size*2-1
      @newitems=[]
      @newitems.fill(nil, 0..last)
      @items.each do |item|
        if item == nil
          next
        end
        @newnumber = index(item[1], size*2)
        item[0] = @newnumber
        @newitems[@newnumber] = item
      end
      @items = @newitems
  end
end
