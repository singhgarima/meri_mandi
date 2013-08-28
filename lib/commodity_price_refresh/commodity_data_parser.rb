require 'open-uri'
require_relative './data_source/gov_data'
class CommodityDataParser
  DATA_SOURCES = [GovData]
  
  def self.parse
    DATA_SOURCES.each do |data_source|
      source = data_source.new
      source.parse_data.each do |data|
        insert_data(data)
      end
    end
  end
  
  private 
  def self.insert_data(data)
    state = State.where(name: data[:state]).first_or_create
    district = state.districts.where(name: data[:district]).first_or_create
    market = district.markets.where(name: data[:market]).first_or_create
    commodity = Commodity.where(name: data[:commodity]).first_or_create
    variety = commodity.varieties.where(name: data[:variety]).first_or_create
    commodity_price = CommodityPrice.new(data).save
  end
end
