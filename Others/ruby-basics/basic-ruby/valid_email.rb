# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
	parts = str.split("@")
  	if parts.length != 2
      return false
    end
  	if parts[1].split(".").length !=2
      return false
    end
  	parts[0].each_char do |part|
        alpha = "abcdefghijklmnopqrstuvwxyz"
		if ! alpha.include?(part)
          return false
        end
    end
    return true

end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false