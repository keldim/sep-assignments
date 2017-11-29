require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    @number = index(key, size)



    if @items[@number] != nil && @items[@number] == value
      return
    elsif @items[@number] != nil && @items[@number].kind_of?(LinkedList) == false
      temp1 = Node.new(@items[@number][1], @items[@number][2])
      temp2 = Node.new(key, value)
      @items[@number] = LinkedList.new
      @items[@number].add_to_tail(temp1)
      @items[@number].add_to_tail(temp2)
    elsif @items[@number] != nil && @items[@number].kind_of?(LinkedList) == true
      temp = Node.new(key, value)
      @items[@number].add_to_tail(temp)
    else
      @items[@number] = [@number, key, value]
    end

     if load_factor > @max_load_factor
      resize
    end


  end

  def [](key)
    @items.each do |item|
      if item == nil
        next
      end
      if item.kind_of?(LinkedList) == true
        temp_node = item.head
        while temp_node.next != nil
          if temp_node.key == key
            return temp_node.value
          else
            temp_node = temp_node.next
          end
        end
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

  # Calculate the current load factor
  def load_factor
    counter = 0
    @items.each do |item|
      if item != nil && item.kind_of?(LinkedList) == false
        counter += 1
      elsif item != nil && item.kind_of?(LinkedList) == true
        temp_node = item.head
        while temp_node != nil
          counter += 1
          temp_node = temp_node.next
        end
      else
        next
      end
    end
    return counter.to_f / size
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
        elsif item != nil && item.kind_of?(LinkedList) == true
          temp_node = item.head
          while temp_node != nil
            @newnumber = index(temp_node.key, size*2)
            if @newitems[@newnumber] != nil && @newitems[@newnumber].kind_of?(LinkedList) == false
              temp1 = Node.new(@newitems[@newnumber][1], @newitems[@newnumber][2])
              temp2 = Node.new(temp_node.key, temp_node.value)
              @newitems[@newnumber] = LinkedList.new
              @newitems[@newnumber].add_to_tail(temp1)
              @newitems[@newnumber].add_to_tail(temp2)
              temp_node = temp_node.next
            elsif @newitems[@newnumber] != nil && @newitems[@newnumber].kind_of?(LinkedList) == true
              temp = Node.new(temp_node.key, temp_node.value)
              @newitems[@newnumber].add_to_tail(temp)
              temp_node = temp_node.next
            else
              @newitems[@newnumber] = [@newnumber, temp_node.key, temp_node.value]
              temp_node = temp_node.next
            end
          end
        else
          @newnumber = index(item[1], size*2)
          item[0] = @newnumber
          @newitems[@newnumber] = item
        end
      end
      @items = @newitems
  end
end
