class Provider < ApplicationRecord
  has_many :visits
  has_many :patients, :through => visits
end
