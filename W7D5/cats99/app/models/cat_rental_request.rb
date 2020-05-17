class CatRentalRequest < ApplicationRecord
  validates :cat_id, :end_date, :start_date, :status, presence: true
  validates :status, inclusion: {in: ['PENDDING', 'APPROVED', 'DENIED']}

  belongs_to :cat

end