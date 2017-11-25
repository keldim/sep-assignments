require 'benchmark'
require_relative 'node'
require_relative 'linked_list'


a = []
b = LinkedList.new

p "Create a 10,000 item array "
puts Benchmark.measure {
  (0...10000).each do |x|
    a[x] = Node.new(x)
  end
}

p "Append 10,000 items to a linked list."
puts Benchmark.measure {
  (0...10000).each do |x|
    b.add_to_tail(Node.new(x))
  end
}

p "Access the 5000th element of the array "
puts Benchmark.measure {
  a[4999]
}

p "Access the 5000th node in the linked list"
puts Benchmark.measure {
  node = b.head
  (1..4999).each do |x|
    node = node.next
  end
}

p "Remove the 5000th element from the array "
puts Benchmark.measure {
  a.delete_at(4999)
}

p "Remove the 5000th node in the linked list"
puts Benchmark.measure {
  node = b.head
  (1..4999).each do |x|
    node = node.next
  end
  b.delete(node)
}
