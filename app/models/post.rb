class Post < ActiveRecord::Base

self.foreign_key = restaurant_id	
  attr_accessible :user_id, :restaurant_id, :content, :display

  belongs_to :user, :dependent => :destroy
end
