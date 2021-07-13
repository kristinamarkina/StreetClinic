class Provider < ApplicationRecord
  has_many :visits
  has_many :patients, :through => :visits
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :specialty, presence: true
end
