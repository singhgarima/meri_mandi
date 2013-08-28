class CommodityPrice < ActiveRecord::Base
	validates :variety_id, uniqueness: { scope: [:market_id, :arrival_date] }
	
	belongs_to :variety
	belongs_to :market

	scope :arrival_date, ->(date = Date.today) { where(arrival_date: date.strftime('%d/%m/%Y')) }

	def self.search name, date
		CommodityPrice.joins(variety: :commodity).arrival_date.where("(varieties.name like '%#{name}%' or commodities.name like '%#{name}%')").to_a
	end
end
