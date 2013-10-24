class Item < ActiveRecord::Base
  attr_accessible :restaurant_id, :item_name, :order_id, :item_type, :item_price, :quantity

  belongs_to :order
end
