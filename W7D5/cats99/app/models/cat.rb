require 'date'
class Cat < ApplicationRecord
  
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: {in: ['red', 'yellow', 'white', 'black', 'brown', 'multi-color'],
          message: "%{value} is not a valid color"}
  validates :sex, inclusion: {in: ['F', 'M'],
          message: "%{value} is not a valid sex"}  
  
  def age
    diff = DateTime.now() - birth_date
    age = (diff/365).to_i
    age
  end
end
