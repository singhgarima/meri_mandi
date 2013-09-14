require 'tire'

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

  def self.fetch name, date = Date.today.strftime('%d/%m/%Y'), market = nil, district = nil, state = nil
    commodity_prices = CommodityPrice.search do
      query do
        boolean do
          should { string "variety_name:*#{name}*"} if name.present?
          should { string "commodity_name:*#{name}*"} if name.present?
          must { string "arrival_date:#{date}" }
          must { string "market_name:#{market}" } if market.present?
          must { string "district_name:#{district}" } if district.present?
          must { string "state_name:#{state}" } if state.present?
        end
      end
      sort { by :max_price, 'asc' }
    end
    commodity_prices
  end
end
