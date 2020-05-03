
#O(1) constant space
def two_sum?(arr, target_sum)
  arr.each_with_index do |a, i |
    if arr[i+1...arr.length].include?(target_sum-a)
      return true
    end
  end
  false
end
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false


#O(nlogn) linearithmic time
#O(n) linear space
def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  i, j = 0, arr.length - 1
  while i < j
    sum = arr[i] + arr[j]
    if sum == target_sum
      return true
    elsif sum < target_sum
      i +=1
    else 
      j -=1
      end
    end
  false
end
arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false


#O(n) linear time
#O(n) linear space
#set and get is O(1) in hash map
def two_sum_hash_map?(arr, target_sum)
  h = {}

  arr.each do |el|
    return true if h[target_sum - el]
    h[el] = true
  end

  false
end

arr = [0, 1, 5, 7]
p two_sum_hash_map?(arr, 6) # => should be true
p two_sum_hash_map?(arr, 10) # => should be false

