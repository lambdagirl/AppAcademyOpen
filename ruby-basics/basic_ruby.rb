#Printing: puts;print;p

#"print"will do minimal formatting and not even add a new line at the end of the print:
print "hello"
print "world"
# => helloworld
print "hello\n"
print "\tworld\n"
# => 
#hello
#  world

#puts, add some formatting, including adding an automatic new line after every puts:

puts "hello"
puts "world"
# =>
# hello
# world

#p prints, add a new line, also gives information on type of data was printed:

p "hello"
p "goodbye"
p 42

# "hello"
# "goodbye"
# 42

###Parentheses?
def greet
    puts "hello world"
  end
  
  # Below are two valid ways to call the greet method.
  greet   # this is preferred since greet does not expect parameters
  greet()

 def greet(name)
    puts "hey " + name
  end
  # Below are two valid ways to call the greet method.
  greet "programmers"

  #array method and enumrate 
def to_initials(name)
	parts = name.split(" ")
  init = ""
  parts.each{|part| init += part[0]}
  return init
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"

#Abbreviate Sentence
def abbreviate_sentence(sent)
	words = sent.split(" ")
  	new_words = []
  	words.each do |word|
  		if word.length < 5
      		new_words << word
        else 
          new_words << abbreviate_word(word)
        end
    end
    return new_words.join(" ")
end

def abbreviate_word(word)
    vowels = "aeiou"
    new_word = ""
  
    word.each_char do |char|
      if !vowels.include?(char)
        new_word += char
      end
    end
  
    return new_word
  end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

