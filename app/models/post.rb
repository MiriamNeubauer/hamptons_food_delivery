class Post < ActiveRecord::Base
  attr_accessible :user_id, :restaurant_id, :content, :display

  belongs_to :user, :dependent => :destroy
end
