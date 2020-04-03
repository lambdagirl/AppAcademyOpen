# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    count = 1
    new = ""
    (0...str.length).each do |i|
        if str[i] == str[i+1]
            count +=1
        elsif count > 1
            new += count.to_s
            new += str[i]
            count = 1
        else
            new += str[i]
        end
    end
    new 
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
