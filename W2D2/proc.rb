#Creating a Proc

doubler = Proc.new {|num| num*2}
p doubler ##<Proc:0x00007fb46d039818@proc.rb:1>


# incorrect
#doubler = { |num| num * 2 } # SyntaxError: unexpected '}'


#Calling a Proc
p doubler.call(2) #4
p doubler.call(7) #14

is_even = Proc.new do |num|
    if num % 2 == 0
        true
    else 
        false
    end
end

p is_even.call(12)


#Passing a Proc to a Method

def add_and_proc(num_1,num_2,prc)
    sum = num_1 + num_2
    p prc.call(sum)
end
add_and_proc(1,4, doubler) #10

square = Proc.new {|num| num *num }
add_and_proc(3,6,square) #81

negate = Proc.new {|num| num * -1}
add_and_proc(3,6,negate) -9

# Version 2: automatic conversion from block to proc
def add_and_proc2(num_1,num_2,&prc)
    sum = num_1 + num_2
    p prc.call(sum)
end
add_and_proc2(1,4) {|num| num*2} # 10a
#add_and_proc(1, 4, doubler)   #error
add_and_proc2(1,4,&doubler)  # 10

# & in the parameters for a method definition, it will convert a block to a proc and 
# & in the arguments for a method call, it will convert a proc to a block.
#Another Example
p [1,2,3].map{|num|num*2} #[2,4,6]
doubler = Proc.new {|num|num*2}
p [1,2,3].map(&doubler)