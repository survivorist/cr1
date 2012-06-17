class Item < ActiveRecord::Base
  attr_accessible :condition, :day_price, :description, :subtitle, :title
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  
  belongs_to :user
end
