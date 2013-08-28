class ModifyCommodityPriceModel < ActiveRecord::Migration
  def change
    remove_column :commodity_prices, :state
    remove_column :commodity_prices, :district
    remove_column :commodity_prices, :market
    remove_column :commodity_prices, :commodity
    remove_column :commodity_prices, :variety
    
    add_column :commodity_prices, :market_id, :integer
    add_column :commodity_prices, :variety_id, :integer
  end
end
