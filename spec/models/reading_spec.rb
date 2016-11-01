require 'rails_helper'

RSpec.describe Reading, type: :model do
  it { should validate_presence_of :glucose_level}
end
