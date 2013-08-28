class District < ActiveRecord::Base
  has_many :markets
  belongs_to :state
end
