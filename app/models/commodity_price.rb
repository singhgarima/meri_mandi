class CommodityPrice < ActiveRecord::Base
	validates :variety_id, uniqueness: { scope: [:market_id, :arrival_date] }
	
	belongs_to :variety
	belongs_to :market
end
