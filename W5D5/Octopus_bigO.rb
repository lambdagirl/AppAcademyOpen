#['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

# linear search
def linear_biggest_fish(fishes)
  max_length = 0
  res = fishes[0]
  fishes.each do |fish|
    if fish.length > max_length
      max_length == fish.length
      res = fish
    end
  end
  return res   
end


# linear octopus dance
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end