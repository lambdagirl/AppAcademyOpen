require 'date'
class Cat < ApplicationRecord

  CAT_COLORS = %w(red yellow white black brown multi-color).freeze
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: {in: ['F', 'M'],
          message: "%{value} is not a valid sex"}  
  
  def age
    diff = DateTime.now() - birth_date
    age = (diff/365).to_i
    age
  end

  has_many :rental_requests,
    class_name: 'CatRentalRequest',
    dependent: :destroy
end
