class Reading < ApplicationRecord
  validates :glucose_level, presence: :true
end
