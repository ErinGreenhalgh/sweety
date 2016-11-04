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

  def self.month_to_date(date = Time.zone.now)
    where(created_at: (date.beginning_of_month..date.end_of_day))
  end

  def self.for_month(date = Time.zone.now)
    where(created_at: (date.beginning_of_month..date.end_of_month))
  end

  def self.report_data(readings)
    glucose_levels = readings.pluck(:glucose_level)
    average = (glucose_levels.reduce(:+)/glucose_levels.count.to_f).round(1)
    {minimum: glucose_levels.min, maximum: glucose_levels.max, average: average}
  end

  def self.format_date(date_string)
    DateTime.parse(date_string)
  end

  def self.report_for_day(date = Time.zone.now)
    formatted_date = format_date(date)
    report_data(Reading.for_day(formatted_date))
  end

  def self.report_for_month_to_date(date)
    report_data(Reading.month_to_date(format_date(date)))
  end

  def self.report_for_month(date)
    report_data(Reading.for_month(format_date(date)))
  end

  def self.available_dates
    pluck("DATE(created_at)").uniq
  end

  def self.available_months
    available_dates.map do |date|
      date.strftime("%B %Y")
    end.uniq
  end
end
