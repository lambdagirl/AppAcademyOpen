def average(num_1, num_2)
    return (num_1 + num_2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
    str * num
end 

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split(" ")
    new_words = words.map.with_index do |word,idx|
        if idx % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end
    new_words.join(" ")
end
# if not asgin mapping to new_words, not work.