require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    temp_node = @head
    if temp_node == nil
      @tail = node
      @head = node
    else
      while temp_node.next != nil
        temp_node = temp_node.next
      end
      temp_node.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp_node = @head
    if temp_node.next == nil
      @head = nil
      @tail = nil
    else
      while temp_node.next != @tail
        temp_node = temp_node.next
      end
      temp_node.next = nil
      @tail = temp_node
    end
  end

  # This method prints out a representation of the list.
  def print
    temp_node = @head
    if temp_node == nil
      puts "nothing in here"
    else
      while temp_node.next != nil
        puts temp_node.data
        temp_node = temp_node.next
      end
      puts temp_node.data
    end

  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp_node = @head
    if node == @head
      @head = temp_node.next
      temp_node = nil
    elsif node == @tail
      while temp_node.next != node
        temp_node = temp_node.next
      end
      temp_node.next = nil
      @tail = temp_node
    else
      while temp_node.next != node
        temp_node = temp_node.next
      end
      temp2 = temp_node.next
      temp_node.next = temp2.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head.next
    @head = temp
  end
end
