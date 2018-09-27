class RemoveShippingAddressFromSaleShippings < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_shippings, :shipping_address, :integer
  end
end
