class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.integer :district_id

      t.timestamps
    end
  end
end
