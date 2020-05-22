class Challenge < ApplicationRecord
  validates :name, :start_date, presence: true

  attribute :start_date, default: DateTime.current
  validate :can_not_early_than_today
  has_many :notes, dependent: :destroy

  def can_not_early_than_today
    return if start_date >= DateTime.current
    errors[:start_date] << 'can not be early than today!'
  end

end
