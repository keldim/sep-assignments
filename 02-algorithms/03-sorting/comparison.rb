require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'


array = (1..50).to_a.shuffle!

p "bucket_sort"
puts Benchmark.measure {
  bucket_sort(array)
}

p "heap_sort"
puts Benchmark.measure {
  heap_sort(array)
}

p "quick_sort"
puts Benchmark.measure {
  quick_sort(array)
}
