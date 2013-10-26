class Item < ActiveRecord::Base

self.foreign_key = restaurant_id	
  attr_accessible :restaurant_id, :item_name, :order_id, :item_type, :item_price, :quantity

  belongs_to :order
end
