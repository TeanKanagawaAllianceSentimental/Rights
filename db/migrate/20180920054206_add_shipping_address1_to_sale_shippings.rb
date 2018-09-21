class AddShippingAddress1ToSaleShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_shippings, :shipping_address1, :string
  end
end
