class Provider < ApplicationRecord
  has_many :visits
  has_many :patients, :through => :visits
  validates :first_name, :last_name, :specialty, presence: true
end
