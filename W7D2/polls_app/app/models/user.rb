class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  
  has_many :authored_poll,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: 'Poll'

end