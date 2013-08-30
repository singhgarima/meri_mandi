FactoryGirl.define do
  factory :commodity do
    sequence(:name) { |n| "CommodityName#{n}" }
  end
end
