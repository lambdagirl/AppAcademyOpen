def my_map(array,&prc)
    mapped=[]
    array.each do |el|
        mapped << prc.call(el)
    end
    mapped
end

def my_select(array,&prc)
    selected = []
    array.each do |el|
        if prc.call(el) == true
            selected << el
        end
    end
    selected
end

def my_count(array,&prc)
    count = 0
    array.each do |el|
        if prc.call(el) == true
            count +=1
        end
    end
    count
end

def my_any?(arr,&prc)
    arr.each do |el|
        if prc.call(el)
            return true
        end
    end
    false
end

def my_all?(arr,&prc)
    arr.each do |el|
        if !prc.call(el)
            return false
        end
    end
    true
end