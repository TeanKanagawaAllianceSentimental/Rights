class CreateSaleShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_shippings do |t|
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :user_telephone
      t.integer :member_id

      t.timestamps
    end
  end
end
