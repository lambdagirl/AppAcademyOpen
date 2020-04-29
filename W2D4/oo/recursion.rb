def say_hello
    p "hello"
    say_hello
end

#say_hello # prints "hello" forever

#Recursive Countdown
def countdown(num)
    #base case
    if num == 0 
        p "the end"
        return
    end
    #recursive step
    p num
    countdown(num-1)
end

countdown(10)


def fib(n)
    return 1 if n === 1 || n === 2
    fib(n - 1) + fib(n - 2)
end