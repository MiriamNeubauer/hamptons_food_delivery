class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

    t.string :user_id
    t.string :restaurant_id
    t.string :content
    t.boolean :display, :default => true

    t.timestamps
    end
  end
end
