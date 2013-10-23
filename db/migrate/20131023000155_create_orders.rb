class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

		t.string :restaurant_id 
		t.string :user_id 
		t.string :item_id 
		t.integer :quantity 
		t.decimal :price_sum 
		t.decimal :sum 
		t.decimal :tip

      t.timestamps
    end
  end
end
