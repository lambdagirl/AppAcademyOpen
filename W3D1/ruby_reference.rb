my_object = Object.new
# my_object now refers to a new instance of Object
my_object = Object.new
# a new Object instance is created, and the my_object variable is
# reassigned so that it now refers to this object, rather than the old
# object.
# call `my_method` on the object that `my_object` refers to
my_object.my_method


#One point is that = does not mutate (modify) an object; it merely reassigns the variable so that it now refers to a new object.
def add_to_array!(array, item)
    array << item 
end
my_array = []
add_to_array!(my_array, "an item!")
p my_array

# The []= and accessor methods
my_hash = {}
my_hash[:key] = :value

class Hash 
    def []=(key,val)
    # code# to set key so that it maps to value...
    end
end

my_hash.[]=(:key, :value)

class Cat 
    # attr_accessor :name
end
my_cat = Cat.new
my_cat.name = "Breakfast" # == my_cat.name=("Breakfast")

# (1 || 2) == 1

#There's an "or trick" that uses ||=