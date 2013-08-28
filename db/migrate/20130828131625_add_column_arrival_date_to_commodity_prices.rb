class AddColumnArrivalDateToCommodityPrices < ActiveRecord::Migration
  def change
    add_column :commodity_prices, :arrival_date, :string
  end
end
