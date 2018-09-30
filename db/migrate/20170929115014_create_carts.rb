class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
    	t.integer :member_id
    	t.integer :item_id
    	t.integer :quantity
    	t.integer :unit_price
    	t.string :session
      t.timestamps
    end
  end
end