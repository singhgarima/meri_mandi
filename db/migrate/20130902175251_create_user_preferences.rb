class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.integer :user_id
      t.integer :market_id
      t.integer :variety_id

      t.timestamps
    end
  end
end
