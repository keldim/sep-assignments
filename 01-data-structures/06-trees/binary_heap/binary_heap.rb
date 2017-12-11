require_relative 'node'

class BinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      value = queue.deq
      if value.left && value.right
        queue.enq(value.left)
        queue.enq(value.right)
      elsif value.left == nil && value.right == nil
        value.left = node
        node.parent = value
        current_value = node
        while current_value.rating > current_value.parent.rating
          if current_value.parent.left == current_value
            if current_value.parent.parent.left == current_value.parent
              if current_value.left != nil
                current_value.parent.right.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.right = current_value.parent.right
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.left.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                if current_value.parent.right != nil
                  current_value.parent.right.parent = current_value
                  current_value.right = current_value.parent.right
                end
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.left = nil
                current_value.left.right = nil
              end
            elsif current_value.parent.parent.right == current_value.parent
              if current_value.left != nil
                current_value.parent.right.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.right = current_value.parent.right
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.left.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                if current_value.parent.right != nil
                  current_value.parent.right.parent = current_value
                  current_value.right = current_value.parent.right
                end
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.left = nil
                current_value.left.right = nil
              end
            end
          elsif current_value.parent.right == current_value
            if current_value.parent.parent.left == current_value.parent
              if current_value.left != nil
                current_value.parent.left.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.right.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                current_value.parent.left.parent = current_value
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.left = nil
                current_value.right.right = nil
              end
            elsif current_value.parent.parent.right == current_value.parent
              if current_value.left != nil
                current_value.parent.left.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.right.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                current_value.parent.left.parent = current_value
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.left = nil
                current_value.right.right = nil
              end
            end
          end
        end
        break
      elsif value.left && value.right == nil
        value.right = node
        node.parent = value
        current_value = node
        while current_value.rating > current_value.parent.rating
          if current_value.parent.left == current_value
            if current_value.parent.parent.left == current_value.parent
              if current_value.left != nil
                current_value.parent.right.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.right = current_value.parent.right
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.left.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                current_value.parent.right.parent = current_value
                current_value.right = current_value.parent.right
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.left = nil
                current_value.left.right = nil
              end
            elsif current_value.parent.parent.right == current_value.parent
              if current_value.left != nil
                current_value.parent.right.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.right = current_value.parent.right
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.left.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                current_value.parent.right.parent = current_value
                current_value.right = current_value.parent.right
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.left = current_value.temp_right
                current_value.temp_right = nil
                current_value.left.parent = current_value
                current_value.left.left = nil
                current_value.left.right = nil
              end
            end
          elsif current_value.parent.right == current_value
            if current_value.parent.parent.left == current_value.parent
              if current_value.left != nil
                current_value.parent.left.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.right.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                current_value.parent.left.parent = current_value
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.left = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.left = nil
                current_value.right.right = nil
              end
            elsif current_value.parent.parent.right == current_value.parent
              if current_value.left != nil
                current_value.parent.left.parent = current_value
                current_value.temp_1 = current_value.right
                current_value.temp_2 = current_value.left
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.right = current_value.temp_1
                current_value.temp_1 = nil
                current_value.right.left = current_value.temp_2
                current_value.temp_2 = nil
              else
                current_value.parent.left.parent = current_value
                current_value.left = current_value.parent.left
                current_value.temp_right = current_value.parent
                current_value.parent.parent.right = current_value
                current_value.parent = current_value.parent.parent
                current_value.right = current_value.temp_right
                current_value.temp_right = nil
                current_value.right.parent = current_value
                current_value.right.left = nil
                current_value.right.right = nil
              end
            end
          end
        end
        break
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
        if temp.parent.left == temp
            temp.left.parent = temp.parent
            temp.parent.left = temp.left
            temp.parent = nil
            temp.left = nil
            temp = temp.left
        elsif temp.parent.right == temp
            temp.left.parent = temp.parent
            temp.parent.right = temp.left
            temp.parent = nil
            temp.left = nil
            temp = temp.left
        end
      elsif  temp.left != nil && temp.right != nil
        if temp.parent.left == temp
          temp.left.parent = temp.parent
          temp.parent.left = temp.left
          temp.right.parent = temp.left
          temp.left.left.temp_right = temp.left.right
          if temp.left.temp_right != nil
            temp.left.right = temp.left.temp_right
            temp.left.temp_right == nil
          else
            temp.left.right = temp.right
          end
          temp = temp.left
        elsif temp.parent.right == temp
          temp.left.parent = temp.parent
          temp.parent.right = temp.left
          temp.right.parent = temp.left
          temp.left.left.temp_right = temp.left.right
          if temp.left.temp_right != nil
            temp.left.right = temp.left.temp_right
            temp.left.temp_right == nil
          else
            temp.left.right = temp.right
          end
          temp = temp.left
        end
      elsif temp.left == nil && temp.right != nil
        if temp.parent.left == temp
            temp.right.parent = temp.parent
            temp.parent.left = temp.right
            temp.parent = nil
            temp.right = nil
            temp = temp.right
        elsif temp.parent.right == temp
            temp.right.parent = temp.parent
            temp.parent.right = temp.right
            temp.parent = nil
            temp.right = nil
            temp = temp.right
        end
      elsif temp.left == nil && temp.right == nil
        if temp.parent.left == temp
          temp.parent.left = nil
          temp.parent = nil
          temp = nil
        elsif temp.parent.right == temp
          temp.parent.right = nil
          temp.parent = nil
          temp = nil
        end
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
