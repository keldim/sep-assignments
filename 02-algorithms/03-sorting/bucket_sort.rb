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

def bucket_sort(array)
  upto_twenty = []
  upto_forty = []
  upto_sixty = []
  upto_eighty = []
  upto_hundered = []

  array.each do |i|
    if i <= 20
      upto_twenty.push(i)
    elsif 20 < i && i <= 40
      upto_forty.push(i)
    elsif 40 < i && i <= 60
      upto_sixty.push(i)
    elsif 60 < i && i <= 80
      upto_eighty.push(i)
    elsif 80 < i && i <= 100
      upto_hundered.push(i)
    end
  end

  quick_sort(upto_twenty) + quick_sort(upto_forty) + quick_sort(upto_sixty) + quick_sort(upto_eighty) + quick_sort(upto_hundered)
end
