#all
p [2,4,6].all? { |ele| ele.even?} #true
p [1,3,6].all? { |ele| ele.even?} #false
#any
p [1,3,6].any? {|ele| ele.even?} #true
p [1,5,7].any? {|ele| ele.even?} #false
#none
p [1,3,5].none? {|ele| ele.even?} #true
#one
p [1,3,2].one? {|ele| ele.even?} #true
p [1,4,2].one? {|ele| ele.even?} #false
#count
p [1,4,2].count {|ele| ele.even?} #2
#max and min
p [1,4,2].min 
p [1,4,2].max 

#flatten :Return the 1 dimensional version of any multidimensional array
multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]
p multi_d.flatten