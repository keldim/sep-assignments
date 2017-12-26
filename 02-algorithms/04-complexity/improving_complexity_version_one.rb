# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end

  sorted_array = [combined_array.pop]
  for val in combined_array
    i = 0
    sorted_length = sorted_array.length
    while i < sorted_length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end
