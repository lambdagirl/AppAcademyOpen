def combinations(arr)
    new_arr =[]
    arr.each_with_index do |ele1, ind1|
        arr.each_with_index do |ele2, ind2|
            if ind1 > ind2
                new_arr << [ele1, ele2]
            end
        end 
    end
    return new_arr
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts