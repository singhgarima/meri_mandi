class Variety < ActiveRecord::Base
  has_many :commodity_prices
	belongs_to :commodity
end
