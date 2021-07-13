class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :provider
  validates :visit_datetime, :complaint, presence: true
  validates :cannot_be_in_the_future

  def cannot_be_in_the_future
    if visit_datetime > Date.today
      errors.add(:visit_datetime, "can't be in the future")
    end
  end
end
