FactoryGirl.define do
  factory :district do
    sequence(:name) { |n| "District#{n}" }
    state
  end
end

