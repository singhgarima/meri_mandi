FactoryGirl.define do
  factory :preference, class: UserPreference do
    user { nil }
    market { FactoryGirl.create(:market) }
    variety { FactoryGirl.create(:variety) }
  end
end