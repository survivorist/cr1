class Item < ActiveRecord::Base
  attr_accessible :condition, :day_price, :description, :subtitle, :title
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validate do |item|
  	item.errors[:base] << "Please provide a good description for other users" if item.description.blank?
  end

  
  belongs_to :user
end
# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  subtitle    :string(255)
#  condition   :integer
#  description :text
#  day_price   :decimal(, )
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

