class Patient < ApplicationRecord
  has_many :visits
  has_many :providers, :through => :visits
  validates :first_name, :last_name, :dob, presence: true
  validate :cannot_be_in_the_future

  def cannot_be_in_the_future
    if dob > Date.today
      errors.add(:dob, "can't be in the future")
    end
  end
end
