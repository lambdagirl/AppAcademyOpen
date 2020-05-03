# O(n^2) quadratic time
# O(n) linear space
def first_anagram?(s1,s2)
  arr1, arr2 = s1.split(''), s2.split('')

  arr =[]
  arr1.each do |ele|
    arr << ele
  end
  arr2.each do |ele|
    return false if !arr.include?(ele)
  end
  true
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

#O(n*log(n)) Linearithmic time
#O(n) Linear space


#sorting both strings alphabetically. 
#The strings are then anagrams if and only if the sorted versions are the identical.

def second_anagram?(s1,s2)
  s1 = s1.split('').sort.join
  s2 = s2.split('').sort.join
  return s1 == s2
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true


#O(n) linear time
#O(1) constant space; 26 alphabet
def third_anagram?(s1,s2)
  dic1 = Hash.new(0)
  dic2 = Hash.new(0)
  s1.each_char { |letter| dic1[letter] += 1}
  s2.each_char { |letter| dic2[letter] += 1}
  dic1 == dic2
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true


#O(n) linear time
#O(1) constant space;
def fourth_anagram?(s1,s2)
  dic = Hash.new(0)
  s1.each_char { |letter| dic[letter] += 1}
  s2.each_char { |letter| dic[letter] -= 1}

  dic.each_value.all?{|ele| ele ==0 }
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
