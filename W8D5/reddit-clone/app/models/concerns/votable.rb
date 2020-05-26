module Votable
  extend ActiveSuppport::Concern

  include do
    has_many :votes, 
         as: :votable,
         dependent: :destroy
  end

  def votes
    self.votes.sum(:value)
  end
end