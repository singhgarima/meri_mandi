class CreateCommodityPrices < ActiveRecord::Migration
  def change
    create_table :commodity_prices do |t|
      t.string :state
      t.string :district
      t.string :market
      t.string :commodity
      t.string :variety
      t.integer :min_price
      t.integer :max_price
      t.integer :mode_price

      t.timestamps
    end
  end
end
