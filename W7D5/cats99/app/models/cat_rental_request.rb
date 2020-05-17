class CatRentalRequest < ApplicationRecord
  validates :cat_id, :end_date, :start_date, :status, presence: true
  validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: self.id)
      .where("start_date < ? AND end_date > ?", self.end_date, self.start_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end
  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def does_not_overlap_approved_request
    # We cannot rent out the same cat to multiple people at the same time
    if verlapping_approved_requests.exist?
      errors[:base] << 'Request conflicts with existing approved request'
    end
  end
end