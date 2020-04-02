[1,2,3].map {|num| -(num *2) }
[1,2,3].map do |num|
    doubled = num * 2
    -doubled
end
["a","b","c"].map {|str| str.upcase}
[1,2,5].select {|num| num.odd?}
#short cut
["a","b","x"].map(&:upcase)
[1,2,5].select(&:odd?)