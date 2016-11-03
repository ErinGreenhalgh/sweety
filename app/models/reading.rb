class Reading < ApplicationRecord
  validate :reading_within_daily_limit, on: :create
  validates :glucose_level, presence: :true
  validates :glucose_level, numericality: { only_integer: true }

  private

  def reading_within_daily_limit
    if Reading.today.count >= 4
      errors.add(:reading, "cannot be entered more than 4 times per day")
    end
  end

  def self.today
    where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day))
  end
end
