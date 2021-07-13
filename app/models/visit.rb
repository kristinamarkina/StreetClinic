class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :provider
  validates :visit_datetime, presence: true
  validates :complaint, presence: true
end
