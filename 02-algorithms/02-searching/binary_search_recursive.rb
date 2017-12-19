def BINARY_SEARCH(collection, value)
  final = collection
  def recursive (array, target)
    if array.length == 1
      return "not found"
    end
    low = 0
    high = array.length - 1
      mid = (low + high) / 2
      if array[mid] > target
        high = mid - 1
      elsif array[mid] < target
        low = mid + 1
      else
        return array[mid]
      end
      recursive(array[low..high], target)
  end
  if recursive(collection, value) == "not found"
    return "not found"
  else
    return final.index(recursive(collection, value))
  end
end
