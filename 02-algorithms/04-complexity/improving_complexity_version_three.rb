def poorly_written_ruby(*arrays)
  combined_array = arrays.map { |array| array }
  return combined_array.flatten!.sort!
end
