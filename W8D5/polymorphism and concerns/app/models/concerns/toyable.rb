module Toyable
  extend ActiveSupport::Concern

  include do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    # This method should first find or create a toy whose name matches the argument. 
    #Next it should add this toy to self's toys. For both steps, you may wish to use the ActiveRecord #find_or_create_by method.
    self.toys.find_or_create_by(name: name)
  end
end