def max_windowed_range(arr, size)
  current_max_range  = -Float::INFINITY
  (0..arr.length- size).each do |i| #O(n)
    current_arr = arr.slice(i, size) 
    max = current_arr.max 
    min = current_arr.min 
    current_max_range = [current_max_range, max - min].max # O(1)
  end
  current_max_range
end


p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8