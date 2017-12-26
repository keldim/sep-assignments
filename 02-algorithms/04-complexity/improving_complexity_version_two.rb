def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end
  combined_array.sort!
end
