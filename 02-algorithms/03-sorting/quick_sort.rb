def merge(left, right)
  left + right
end

def quick_sort(collection)
  if collection.length <= 1
    return collection
  end
  f = collection.length - 1
  n = collection.length - 1
  g = 0
  while g < n
    if collection[g] > collection[n]
      collection.insert((n), collection.delete_at(g))
      n -= 1
    else
      g += 1
    end
  end
  if n == 0
    left = []
    right = quick_sort(collection[n..f])
  else
    left = quick_sort(collection[0..(n-1)])
    right = quick_sort(collection[n..f])
  end
  merge(left,right)
end
