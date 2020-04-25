def sqrt(num)
  unless num >= 0
    raise ArgumentError.new "Cannot take sqrt of negative number"
  end

  # code to calculate square root...
end

def main
  # run the main program in a loop
    # get an integer from the user
    puts "Please input a number"
    num = gets.to_i

    begin
      sqrt(num)
    rescue ArgumentError => e
      puts "Couldn't take the square root of #{num}"
      puts "Error was: #{e.message}"
    end
end

#A common response to an error is to try, try again.
  def prompt_name
    puts "please input as name:"
    name_parts = gets.chomp.split

    if name_parts.count != 2
      raise "Uh-oh, finnicky parsing!"
    end

    name_parts
  end

  def echo_name
    begin
      fname, lname = prompt_name
      puts "hello #{fname} of #{lname}"
    rescue
      puts "Please only use two names."
      retry
    end
  end

#Implicit Begin Blocks
def slope(pos1, pos2)
  (pos2.y - pos1.y) / (pos2.x - pos1.x)
rescue ZeroDivisionError
  nil
end


def echo_name1
  fname, lname = prompt_name
  puts "hello #{fname} of #{lname}"
rescue
  puts "Please only use two names."
  retry
end

#Exception Hierarchy
class EngineStalledError < StandardError
end
class CollisionOccureedError < StandardError
end

def drive_car
  # engine may stall, collision may occur
end

begin
  drive_car
rescue EngineStalledError => e
  puts "Rescue from engine stalled!"
rescue CollisionOccureedError => e
  puts "Rescued from collision!"
ensure
  puts "car stopped!"
end