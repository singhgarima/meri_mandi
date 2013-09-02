class User < ActiveRecord::Base
include Clearance::User

  belongs_to :state
  belongs_to :market
  has_many :user_preferences
  
  validates :mobile, presence: true, uniqueness: true
  
  def authenticate(identifier, password)
    if user = find_by_mobile(identifier) || find_by_normalized_email(identifier)
      if password.present? && user.authenticated?(password)
        return user
      end
    end
  end
end
