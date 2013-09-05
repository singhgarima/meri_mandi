class CommodityPrice < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  self.include_root_in_json = false
  belongs_to :variety, touch: true
  belongs_to :market, touch: true

  mapping do
    indexes :id,           type: "integer"
    indexes :min_price,    type: "string", index: "not_analyzed"
    indexes :max_price,    type: "string", index: "not_analyzed"
    indexes :mode_price,   type: "string", index: "not_analyzed"
    indexes :arrival_date, type: "string"
    indexes :variety_name, type: "string", as: "variety.name"
    indexes :commodity_name, type: "string", as: "variety.commodity.name"
    indexes :market_name, type: "string", as: "market.name"
    indexes :district_name, type: "string", as: "market.district.name"
    indexes :state_name, type: "string", as: "market.district.state.name"
  end

  validates :variety_id, uniqueness: { scope: [:market_id, :arrival_date] }

  scope :arrival_date, ->(date = Date.today) { where(arrival_date: date.strftime('%d/%m/%Y')) }

  def self.simple_search name, date = Date.today.strftime('%d/%m/%Y')
    CommodityPrice.search do
      query do
        boolean do
          should { string "variety_name:*#{name}*"}
          should { string "commodity_name:*#{name}*"}
          must { string "arrival_date:#{date}" }
        end
      end
    end.collect { |cp| cp }
  end

  def self.advanced_search name, date = Date.today.strftime('%d/%m/%Y'), market = nil, district = nil, state = nil
    commodity_prices = CommodityPrice.search do
      query do
        boolean do
          should { string "variety_name:*#{name}*"}
          should { string "commodity_name:*#{name}*"}
          must { string "arrival_date:#{date}" }
          must { string "market_name:#{market}" } if market.present?
          must { string "district_name:#{market}" } if district.present?
          must { string "state_name:#{market}" } if state.present?
        end
      end
    end
    commodity_prices
  end
end
