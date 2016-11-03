require 'rails_helper'

RSpec.describe Reading, type: :model do
  it { should validate_presence_of :glucose_level }

  scenario "can have no more than 4 entries per day" do
    4.times do
      create(:reading)
    end

    expect{ create(:reading) }.to raise_error(/Reading cannot be entered more than 4 times per day/)
  end
end
