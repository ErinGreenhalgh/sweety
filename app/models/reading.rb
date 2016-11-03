class Reading < ApplicationRecord
  validate :reading_within_daily_limit, on: :create
  validates :glucose_level, presence: :true
  validates :glucose_level, numericality: { only_integer: true }

  private

  def reading_within_daily_limit
    if Reading.for_day.count >= 4
      errors.add(:reading, "cannot be entered more than 4 times per day")
    end
  end

  def self.for_day(date = Time.zone.now)
    where(created_at: (date.beginning_of_day..date.end_of_day))
  end

  # def self.month_to_date(date)
  #   where(created_at: (Time.zone.now.beginning_of_month..Time.zone.now.end_of_day))
  # end
  #
  # def self.monthly(month, year)
  #   where("extract (month from created_at) = ? AND extract(year from created_at) = ?", month, year)
  # end
end
