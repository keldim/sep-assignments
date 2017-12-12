class HashClass
  attr_accessor :items
  attr_accessor :number
  attr_accessor :newitems
  attr_accessor :newnumber

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    @number = index(key, size)
    if @items[@number] != nil && @items[@number][2] != value
      resize
      @number = index(key, size)
      if @items[@number] != nil
        @number = @items.index(nil)
        @items[@number] = [@number, key, value]
      else
        @items[@number] = [@number, key, value]
      end
    elsif @items[@number] != nil && @items[@number][2] == value
      return
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

  def resize
    @newItems = Array.new( size * 2)
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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
