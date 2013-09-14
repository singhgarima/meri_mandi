class User < ActiveRecord::Base
  include Authorize::User

  belongs_to :state
  belongs_to :market
  has_many :user_preferences
  
  validates :mobile, presence: true, uniqueness: true
end
