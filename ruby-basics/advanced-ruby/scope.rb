#Constants
Food = "pho"
p Food
Food[0] = "P"
p Food
# Food = "ramen"  #warning: already initialized constant FOOD
$drink = "ice coffee"
def my_favorite
    p Food
    p $drink
end 
my_favorite

$message = "hello globe"

def say_hello
    p $message
end

say_hello # => "hello globe"