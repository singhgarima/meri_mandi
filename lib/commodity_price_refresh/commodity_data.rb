require 'open-uri'
require_relative './data_source/gov_data'
class CommodityData
  DATA_SOURCES = [GovData]

  def self.refresh
    DATA_SOURCES.each do |data_source|
      p "      Executing data fetch from '#{data_source}'"
      source = data_source.new
      source.parse_data.each do |data|
        insert_data(data)
      end
    end
    index_data
  end

  private 
  def self.insert_data(data)
    state = State.where(name: data.delete(:state)).first_or_create
    district = state.districts.where(name: data.delete(:district)).first_or_create
    market = district.markets.where(name: data.delete(:market)).first_or_create
    commodity = Commodity.where(name: data.delete(:commodity)).first_or_create
    variety = commodity.varieties.where(name: data.delete(:variety)).first_or_create
    commodity_price = market.commodity_prices.new(data.merge(variety: variety)).save
  end

  def self.index_data
    CommodityPrice.index.import CommodityPrice.arrival_date
  end
end
