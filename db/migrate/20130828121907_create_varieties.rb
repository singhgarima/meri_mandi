class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :name
      t.integer :commodity_id

      t.timestamps
    end
  end
end
