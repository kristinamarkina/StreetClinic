class Patient < ApplicationRecord
  has_many :visits
  has_many :providers, :through => :visits
end
