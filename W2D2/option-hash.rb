
#default value

def repeat(message,num=1)
    message * num
end
p repeat("hi") # "hi"
p repeat("hi",3) #"hihihi"

#optional argument
def greet(person_1, person_2=nil)
    if person_2.nil?
        p "Hey "+ person_1
    else
        p "Hey "+ person_1 + " and "+ person_2
    end 
end
greet("Chao")
greet("Chao", "Arittro")

#best pritice is to have the optional parameters listed after the required one.
def greet(person_1="default", person_2)
    p person_1 + " and " + person_2
end

#although "Chao" is first argument passed in, person_2 will be assigned "Chao".
greet("Chao") # => "default and Chao"

#Option Hashes
# if you have a method that accepts a hash, you can ommit the braces when passing in the hash
def method(hash)
    p hash  # {"location"=>"SF", "color"=>"red", "size"=>100}
end
method({"location"=>"SF", "color"=>"red", "size"=>100})
method("location"=>"SF", "color"=>"red", "size"=>100)

#This can really clean things up when you have other arguments before the hash:

def modify_string(str, options)
    str.upcase! if options["upper"]
    p str * options["repeats"]
end
modify_string("bye", {"upper"=>true, "repeats"=>3}) # => "BYEBYEBYE"
modify_string("bye", "upper"=>true, "repeats"=>3) # => "BYEBYEBYE"

#hash with default option
def modify_string(str, options = {"upper"=>false, "repeats"=>1})
    str.upcase! if options["upper"]
    p str * options["repeats"]
end
modify_string("bye")
modify_string("bye", "upper"=>true, "repeats"=>3) # => "BYEBYEBYE"
