class Order < ActiveRecord::Base

self.foreign_key = restaurant_id

  attr_accessible :restaurant_id, :user_id, :item_id, :quantity, :price_sum, :sum, :tip
  #item type wäre appetizer, dessert, main, beverage
  belongs_to :user
  has_many :items, :dependent => :destroy
end
