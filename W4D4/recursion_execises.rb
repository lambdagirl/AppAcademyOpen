def range(s,e)
  return []  if e <= s 
  range(s,e-1)<<(e-1)
end

#dup method doesn't make a deep copy
robot_parts = [
  ["nuts","bolts","washers"],
  ["capacitors","resistors","inductors"]
]
robot_parts_copy = robot_parts.dup
#doesn't modify the robot_parts
robot_parts_copy << "LED"

#modify the robot_parts
robot_parts_copy[1] << "ROBOTS"

p robot_parts_copy
p robot_parts

#DEEP DUP
class Array
  def deep_dup
    new_array =[]
    self.each do |e|
      new_array << (e.is_a?(Array)?? e.deep_dup : e)
  end
end

#BINARY SEARCH
def bsearch(array,target)
  return nil if array.empty?
  mid = array.length/2
  if target == array[mid]
    return mid
  elsif target < array[mid]
    bsearch(array.take(mid), target)
  else
    #use subarray to track the index
    sub_answer = bsearch(array.drop(mid+1), target)
    sub_answer.nil? ? nil : mid+1+sub_answer
  end
end

# Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.
# Array Subsets

def merge_sort(arr)
end