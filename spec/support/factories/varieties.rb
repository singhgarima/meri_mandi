FactoryGirl.define do
  factory :variety do
    sequence(:name) { |n| "name#{n}" }
    commodity
  end
end
