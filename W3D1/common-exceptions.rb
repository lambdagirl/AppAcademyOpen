#NameError
class NumbersClass
    def answer_number
        42
    end
    def longliest_number
        1
    end

    def numbers
        [favorite_number,longliest_number]
    end
end

#NoMethodError
#ArgumentError: wrong number of arguments

#TypeError => add a string to a number(integer) or array

#loadError
#pry(main)> require 'primes.rb'
#pry(main)> require './primes.rb'

#syntaxError
[1,2,3].each do |num|
    puts num
end
end