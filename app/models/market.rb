class Market < ActiveRecord::Base
  has_many :commodity_prices
end
