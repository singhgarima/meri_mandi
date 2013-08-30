FactoryGirl.define do
  factory :market do
    sequence(:name) { |n| "Market#{n}" }
    district
  end
end

