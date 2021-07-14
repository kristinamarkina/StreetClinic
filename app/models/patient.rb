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

  def full_name
    [first_name, last_name].select(&:present?).join(' ').titleize
  end

  def age
    now = Date.today
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
