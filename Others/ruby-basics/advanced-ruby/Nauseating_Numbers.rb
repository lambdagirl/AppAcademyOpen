def strange_sums(arr)
    count=0
    arr.each_index do |i|
        if arr[i+1..arr.length-1].include?(-arr[i])
            count +=1
        end
    end
    count
end

def pair_product(arr, prod)
    arr.each_index do |i|
        if prod % arr[i] == 0 && arr[i+1..arr.length-1].include?(prod/arr[i].to_f)
            return true
        end
    end
    false
end

def rampant_repeats(str,hash)
    new_str=""
    str.each_char do |ele|
        if hash.has_key?(ele)
            new_str += ele * hash[ele]
        else 
            new_str += ele
        end
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2}) 

def perfect_square(num)
    (0...num+1).each {|n| return true if num/n.to_f == n }
    false
end

def perfect_square2(n)
    (0...n).any? {|i| i * i = n }
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def matrix_addition(mtr1,mtr2)
    height = mtr1.length
    width = mtr1[0].length
    res = Array.new(height){ [0] * width }
    (0...height).each do |row|
        (0...width).each do |col|
            res[row][col] = mtr1[row][col] + mtr2[row][col]
        end
    end
    res
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
