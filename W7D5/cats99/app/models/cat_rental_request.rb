class CatRentalRequest < ApplicationRecord
  validates :cat_id, :end_date, :start_date, :status, presence: true
  validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}
  # validates :start_must_come_before_end
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

  def approve!
    raise 'not pending' unless self.status == 'PENDING'
    transaction do 
      self.update!(status: "APPROVED")

      #when we approve this request, we reject all other overlapping
      #request for this cat.
      overlapping_pending_requests.each do |req|
         req.update!(status: "DENIED")
      end 
    end
  end

  def deny!
    self.update!(status: "DENIED")
  end

  def approved?
    self.status = 'APPROVED'
  end
  
  def pending?
    self.status == 'PENDING'
  end

  private
  def start_must_come_before_end
    if start_date >= end_date
      errors[:start_date] << 'must come before end date'
      errors[:end_date] << 'must come after start date'
    end
  end
end