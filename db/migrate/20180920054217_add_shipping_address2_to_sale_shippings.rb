class AddShippingAddress2ToSaleShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_shippings, :shipping_address2, :string
  end
end
