class Sub < ApplicationRecord
  validates :description, :title, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
    class_name: :User,
    foreign_key: :moderator_id,
    primary_key: :id,
    inverse_of: :subs

  has_many :posts,
    class_name: :Post,
    foreign_key: :sub_id,
    primary_key: :id

  has_many :post_sub, dependent: :destroy

end
