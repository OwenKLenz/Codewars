def sum_pairs(arr, target)
  index = 1
      
  loop do  
    arr[0..index-1].each do |num|
      return [num, arr[index]] if num + arr[index] == target
    end

    current_value = arr.delete(arr[index])
    arr.insert(index, current_value)

    index += 1
    return nil if index == arr.size 
  end
end
