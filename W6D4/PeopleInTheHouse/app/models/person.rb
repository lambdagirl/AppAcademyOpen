class Person < ApplicationRecord
  #must have name
  #default error message is "X can't be empty".
  validates :name, presence:true

  belongs_to :appartment,
  primary_key: :id,
  foreign_key: :house_id,
  class_name: :House

end