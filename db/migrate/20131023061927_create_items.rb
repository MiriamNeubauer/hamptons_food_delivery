class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|


    	t.string :restaurant_id
    	t.string :order_id
    	t.string :item_name
    	t.string :item_type
    	t.decimal :item_price

      t.timestamps
    end
  end
end
