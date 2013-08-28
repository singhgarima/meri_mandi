class Variety < ActiveRecord::Base
  has_many :commodity_prices
end
