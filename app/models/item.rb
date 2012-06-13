class Item < ActiveRecord::Base
  attr_accessible :condition, :day_price, :description, :subtitle, :title
  validates :user_id, presence: true
  belongs_to :user
end
