def sum_to(n)
  return nil if n < 0
  return 0 if n == 0
  n + sum_to(n-1)
end

puts sum_to(-1)

def add_numbers(nums_array)
  return nil if not nums_array
  return nums_array[0] if nums_array.length == 1
  nums_array.pop + add_numbers(nums_array)
end

puts add_numbers([1, 2, 3, 4])


def gamma_fnc(n)
  return nil if n == 0

  def fibonacci(n)
    return 1 if n == 0
    n * fibonacci(n-1) 
  end

  return fibonacci(n-1)
end

# Test Cases

puts gamma_fnc(8)  # => returns 5040


def ice_cream_shop(flavors, favorite)
  return false if flavors.empty? 
  return true if flavors.pop == favorite
  ice_cream_shop(flavors,favorite)
end

# Test Cases
puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
puts ice_cream_shop([], 'honey lavender')  # => returns false


def reverse(string)
  return "" if string.empty?
  string[-1] + reverse(string[0..-2])
end

# Test Cases
puts reverse("house") # => "esuoh"
puts reverse("dog") # => "god"
puts reverse("atom") # => "mota"

puts reverse("") # => ""