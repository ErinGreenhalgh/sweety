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


  # scenario "gives all the readings for the month to the given date" do
  # end
  #
  # scenario "gives all the readings for a given month and year" do
  #   reading_last_month = create(:reading, created_at: DateTime.now.last_month)
  #   readings_this_month = create_list(:reading, 3)
  #   expect(Reading.monthly())
  #
  # end
end
