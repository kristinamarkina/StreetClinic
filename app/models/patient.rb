class Patient < ApplicationRecord
  has_many :visits
  has_many :providers, :through => :visits
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
end
