require 'rails_helper'

RSpec.describe Reading, type: :model do
  it { should validate_presence_of :glucose_level }
  it { should validate_numericality_of(:glucose_level).only_integer }

  scenario "can have no more than 4 entries per day" do
    4.times do
      create(:reading)
    end

    expect{ create(:reading) }.to raise_error(/Reading cannot be entered more than 4 times per day/)
  end

  scenario "gives all the readings for today" do
    readings_today = create_list(:reading, 3)
    reading_yesterday = create(:reading, created_at: DateTime.now.yesterday)
    expect(Reading.for_day).to eq readings_today
    expect(Reading.for_day).not_to include(reading_yesterday)
  end

  scenario "gives all the readings for a given day" do
    date = DateTime.now.yesterday
    readings = [create(:reading, created_at: date),
                create(:reading, created_at: date),
                create(:reading, created_at: date)]
    other = create(:reading)
    expect(Reading.for_day(date)).to eq readings
    expect(Reading.for_day(date)).not_to include(other)
  end


  scenario "gives all the readings for the month to the given date" do
    date = DateTime.parse("02-11-2016")
    other_reading = create(:reading, created_at: (date - 3.days) )
    reading1 = create(:reading, created_at: date.yesterday)
    reading2 = create(:reading, created_at: date)
    reading3 = create(:reading, created_at: date.tomorrow)
    selected_date = date + 2.days

    result = Reading.month_to_date(selected_date)
    expect(result).to eq [reading1, reading2, reading3]
    expect(result).not_to include(other_reading)
  end

  scenario "gives all the readings for a given month" do
    selected_date = DateTime.parse("02-11-2016")
    october_readings = create_list(:reading, 3, created_at: selected_date.last_month)
    november_readings = create_list(:reading, 3, created_at: selected_date)
    october = DateTime.parse("October 2016")

    result = Reading.for_month(october)
    expect(result).to eq october_readings
  end
end
