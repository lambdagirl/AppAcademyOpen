#Getting Input ; gets
 
p "enter your name"
# "enter your name"
name = gets
p "hello " + name
#"hello ddd\n"


#Chomping New Lines
p my_string = "yes\n" #"yes\n"
p my_string.chomp #"yes"


puts "Enter 'yes' or 'no'"

response = gets.chomp

if response == "yes"
  puts "yup!"
elsif response == "no"
  puts "nah!"
else
  puts "I'm sorry, my responses are limited."
end

numeric_string = "42"
p numeric_string      # "42"
p numeric_string.to_i # 42

puts "Enter  a number:"
num = gets.chomp.to_i  
puts 2 * num