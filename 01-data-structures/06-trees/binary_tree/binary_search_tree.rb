require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root
    while current_node != nil
      if current_node.left == nil && current_node.right == nil
        if current_node.rating > node.rating
          current_node.left = node
          node.parent = current_node
          current_node = nil
        elsif current_node.rating < node.rating
          current_node.right = node
          node.parent = current_node
          current_node = nil
        end
      elsif current_node.left != nil && current_node.right == nil
        if current_node.rating > node.rating
          current_node = current_node.left
        elsif current_node.rating < node.rating
          current_node.right = node
          node.parent = current_node
          current_node = nil
        end
      elsif current_node.left == nil && current_node.right != nil
        if current_node.rating > node.rating
          current_node.left = node
          node.parent = current_node
          current_node = nil
        elsif current_node.rating < node.rating
          current_node = current_node.right
        end
      elsif current_node.left != nil && current_node.right != nil
        if current_node.rating > node.rating
          current_node = current_node.left
        elsif current_node.rating < node.rating
          current_node = current_node.right
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
      if root.title == data
          return root
      end
      left = find(root.left, data) if root.left
      right = find(root.right, data) if root.right
      left or right
  end

  def delete(root, data)
    if data == nil
      return nil
    end

    temp = find(root,data)


    while temp != nil
      if temp.left != nil && temp.right == nil
        temp.left.parent = temp.parent
        if temp.parent.rating > temp.rating
          temp.parent.left = temp.left
        elsif temp.parent.rating < temp.rating
          temp.parent.right = temp.left
        end
        temp = temp.left
      elsif temp.left == nil && temp.right != nil
        temp.right.parent = temp.parent
        if temp.parent.rating > temp.rating
          temp.parent.left = temp.right
        elsif temp.parent.rating < temp.rating
          temp.parent.right = temp.right
        end
        temp = temp.right
      elsif temp.left != nil && temp.right != nil
        temp.left.parent = temp.parent
        if temp.parent.rating > temp.rating
          temp.parent.left = temp.left
        elsif temp.parent.rating < temp.rating
          temp.parent.right = temp.left
        end
        temp.right.parent = temp.left
        temp.left.left.temp_right = temp.left.right
        if temp.left.temp_right != nil
          temp.left.right = temp.left.temp_right
          temp.left.temp_right == nil
        else
          temp.left.right = temp.right
        end
        temp = temp.left
      elsif temp.left == nil && temp.right == nil
        if temp.parent.rating > temp.rating
          temp.parent.left = nil
        elsif temp.parent.rating < temp.rating
          temp.parent.right = nil
        end
        temp = temp.left
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}\n"
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end
end
