class CommodityPrice < ActiveRecord::Base
	def self.parse_from_xml(parent)
		new(state: parent.xpath('state').text, district: parent.xpath('district').text, market: parent.xpath('market').text, commodity: parent.xpath('commodity').text, variety: parent.xpath('variety').text, min_price: parent.xpath('min_x0020_Price').text, max_price: parent.xpath('max_x0020_Price').text, mode_price: parent.xpath('modal_x0020_Price').text)
	end
end
