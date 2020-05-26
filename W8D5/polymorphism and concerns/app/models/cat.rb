class Cat < ApplicationRecord
  include Toyable

  has_many :toys
end
