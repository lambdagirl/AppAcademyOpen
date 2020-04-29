 #Less prefered
def get_avg(num_1,num_2)
    return (num_1+num_2) / 2
end

#preferred 
def get_avg(num_1,num_2)
    (num_1+num_2) / 2
end

######drop the parentheses, when calling a method without passing any arguments
def say_hi
    puts "hi"
end
#less preferred
say_hi()
#prefered
say_hi

######Use single line conditionals when possible
raining = true
#less preferred
if raining
    puts "don't forget an umbrella!"
end 
#preferred
puts "don't forget an umbrella!" if raining

######Use built-in methods:

num = 6
#less preferred
p num % 2 == 0 
# preferred
p num.even?

people = ["Joey", "Bex", "Andrew"]
#less preferred
p people[people.length -1]
#prefferred by a Rubyist
p people[-1]
p people.last

######Use enumerables to iterate
#less preferred
def repeat_hi(num)
    i = 0
    while i < num
        puts "hi"
        i += 1
    end 
end 
# preferred
def repeat_hi(num)
    num.times{ puts "hi" }
end

#less preferred
def all_numbers_even?(nums)
    nums.each do |num|
        return false if num % 2 != 0
    end 

    true 
end
#preferred
def all_numbers_even?(nums)
    nums.all?{|num| num.even?}