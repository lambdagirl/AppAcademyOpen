#inject with only a block
p [11,8,2,4].inject { |acc,el| acc + el }




p [11, 7, 2, 4].inject(100) { |acc, el| acc + el }

p [11, 7, 2, 4].inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end # => 6
