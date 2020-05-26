class Corgi < ApplicationRecord
  include Toyable

  has_many :toys
end
