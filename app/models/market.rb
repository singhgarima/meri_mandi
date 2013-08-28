class Market < ActiveRecord::Base
  has_many :commodity_prices
  belongs_to :district
end
