class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.references :state
      t.string :city
      t.references :market

      t.timestamps
    end
  end
end
