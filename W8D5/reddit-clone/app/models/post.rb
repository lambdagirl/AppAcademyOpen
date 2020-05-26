class Post < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, :author_id, :sub_id, presence: true 

  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id

  belongs_to :subs,
    class_name: :Sub,
    foreign_key: :sub_id,
    primary_key: :id
end
