class DataParser
	URL = 'http://data.gov.in/sites/default/files/Date-Wise-Prices-all-Commodity.xml'			
	def self.parse
		doc = Nokogiri::HTML(open(URL))
		commodity_prices = []
		tables = doc.xpath('//table')
		return commodity_prices if tables[0].xpath('arrival_date').text == CommodityPrice.last.created_at.strftime('%d/%m/%Y')
		tables.each do |table|
			commodity_prices << CommodityPrice.parse_from_xml(table).save!
		end
		commodity_prices
	end
end
