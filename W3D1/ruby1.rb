#Dynamic
def erroneous_addition(x)
    if x > 99999
      print "Luckily I'm a valid statement!"
    else
      print "The Ruby interpreter is about to be a complainy-pants!" + x
    end
  end
  
erroneous_addition(Float::INFINITY)
#erroneous_addition(1)

#nonreflective
obj = Foo.new
obj.hello

# reflective
class_name = "Foo"
method_name = :hello

# The program can inspect and modify source code constructions such as classes
# and methods at runtime. It can even convert strings or symbols matching
# symbolic names of those constructions into references to them.
obj = Object.const_get(class_name).new
obj.send method_name

# The program can evaluate a string as if it were source code at runtime.
eval "Foo.new.hello"