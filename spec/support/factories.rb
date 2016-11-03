FactoryGirl.define do
  factory :reading do
    sequence(:glucose_level) { |n| 10 + n }
  end
end
