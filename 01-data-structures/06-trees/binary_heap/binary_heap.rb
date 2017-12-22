require_relative 'node'

class BinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating
    temp = root
    @root = node
    node = temp
    insert(@root, node)
  else
    if root.left.nil?
      root.left = node
    elsif root.right.nil? && root.left != nil
      root.right = node
    elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
      insert(root.right, node)
    elsif root.left != nil && root.right != nil
      insert(root.left, node)
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
    temp.nil? ? nil : (temp.title = nil && temp.rating = nil)

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
