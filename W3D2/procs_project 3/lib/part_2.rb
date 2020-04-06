def reverser(string,&prc)
    prc.call(string.reverse)
end

def word_changer(string,&prc)
    new_words =[]
    words = string.split(" ")
    words.each do |word| 
        new_words << prc.call(word)
    end
    new_words.join(" ")
end

def greater_proc_value(num,prc1,prc2)
    num1 = prc1.call(num)
    num2 =prc2.call(num)
    if num1 > num2
        return num1
    end
    num2
end

def and_selector(arr,prc1,prc2)
    selected = []
    arr.each do |ele|
        if prc1.call(ele) == true && prc2.call(ele) == true
            selected << ele
        end
    end
    selected
end

def alternating_mapper(arr,prc1,prc2)
    mapped=[]
    arr.each_with_index do |el,idx|
        if idx.even?
            mapped<< prc1.call(el)
        else
            mapped<< prc2.call(el)
        end
    end
    mapped

end
