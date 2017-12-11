require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'binary_heap/binary_heap'


tree_root = Node.new("tree root", 50000)
heap_root = Node.new("heap root", 100000)
tree = BinarySearchTree.new(tree_root)
heap = BinaryHeap.new(heap_root)




n = 100000

Benchmark.bm(100) do |x|
  x.report("binary tree insert") do
    for i in 1..n do
      new_node = Node.new("tree", Random.rand(100000))
      tree.insert(tree_root, new_node)
    end
  end
   x.report("binary heap insert") do
     for i in 1..n do
       new_node = Node.new("heap", Random.rand(100000))
       heap.insert(heap_root, new_node)
     end
   end
end

target = Node.new("target", 2500)
tree.insert(tree_root, target)
heap.insert(heap_root, target)

Benchmark.bm(100) do |x|
  x.report("binary tree find") do
      tree.find(tree_root, "target")
  end
   x.report("binary heap find") do
     heap.find(heap_root, "target")
   end
end

Benchmark.bm(100) do |x|
  x.report("binary tree delete") do
      tree.delete(tree_root, "target")
  end
   x.report("binary heap delete") do
     heap.delete(heap_root, "target")
   end
end
