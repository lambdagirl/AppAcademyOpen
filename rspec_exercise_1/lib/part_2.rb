def hipsterfy(word)
    vowels = "aeiou"
    last_v_idx =-1
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            last_v_idx = idx
        end
    end
    if last_v_idx > 0
        word[last_v_idx] = ""
    end
    return word
end

def vowel_counts(sentence)
    vowels = "aeiou"
    new_s = sentence.split(" ").join("")
    res={}
    p new_s
    new_s.each_char do |c|
        char = c.downcase
        if vowels.include?(char)
            if res.key?(char)
                res[char] +=1
            else
                res[char] = 1
            end
        end
    end
    return res
end

def caesar_cipher(message,n)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    new_message= ""
    message.each_char do |letter|
        if alpha.include?(letter)
            if (alpha.index(letter) + n > 25)
                new_message+=alpha[(alpha.index(letter) + n)%26]
            else
                new_message+=alpha[alpha.index(letter) + n]
            end
        else
            new_message+=letter
        end
    end
    return new_message
end

