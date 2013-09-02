class UserPreference < ActiveRecord::Base
  belongs_to :user
  belongs_to :market
  belongs_to :variety
  
  validates :user_id, presence: true
  validates :market_id, presence: true
  validates :variety_id, presence: true
end
