#begin...rescue
num = 0
begin
    puts "dividing 10 by #{num}"
    ans = 10 /num 
    puts "the answer is #{num}"
rescue
    puts "There was an error with that division."
end

puts "-------"
puts "finished"

#ArgumentError
#NameError
#NoMethodError
#IndexError
#TypeError


#Raising Exceptions



#raise is how we bring up an exception, whereas begin...
#rescue is how we react to that exception.

def format_name(first, last)
    first.capitalize + " " + last.capitalize
  end
  
  format_name("grace", "HOPPER") # => "Grace Hopper"

#format_name(42, true) 
#exceptions.rb:29:in `format_name': undefined method `capitalize' for 42:Integer (NoMethodError)

p "hello".instance_of?(String)
p 42.instance_of?(String)

def format_name1(first,last)
    if !(first.instance_of?(String) && last.instance_of?(String))
        raise "arguments must be strings"
    end

    first.capitalize + " " + last.capitalize
end

#format_name1("grace", "hopper") # => "Grace Hopper"
#format_name1(42, true)     

def format_name(first, last)
    if !(first.instance_of?(String) && last.instance_of?(String))
      raise "arguments must be strings"
    end
  
    first.capitalize + " " + last.capitalize
  end
  
  
  begin
    puts format_name2(first_name, last_name)
  rescue
    # do stuff to rescue the "arguments must be strings" exception...
    puts "there was an exception :("
  end

format_name2("grace", "hopper") # => "Grace Hopper"
format_name2(42, true)     

