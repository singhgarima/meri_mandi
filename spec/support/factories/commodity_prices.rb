FactoryGirl.define do
  factory :commodity_price do
    min_price 10
    max_price 20
    mode_price 25
    arrival_date Date.today.strftime("%d/%m/%Y")
    market
    variety
  end
end

