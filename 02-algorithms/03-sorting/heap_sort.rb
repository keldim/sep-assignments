def heap_sort(array)
  if array.length <= 1
    return array
  else
    heapify(array)
    ender = (array.length - 1)
    while ender > 0
      array[ender], array[0] = array[0], array[ender]
    ender -= 1
    sift_down(array, 0, ender)
    end
    return array
  end
end

def heapify(array)
  starter = (array.length - 2) / 2
  while starter >= 0
    sift_down(array, starter, array.length - 1)
    starter -= 1
  end
  array
end

def sift_down(array, starter, ender)
  root = starter
  loop do
    child = root * 2 + 1
    break if child > ender
    if child + 1 <= ender and array[child] < array[child + 1]
      child += 1
    end
    if array[root] < array[child]
      array[root], array[child] = array[child], array[root]
      root = child
    else
      break
    end
  end
end
