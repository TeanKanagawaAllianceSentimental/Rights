class AddShippingAddressIdToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :shipping_address_id, :integer
  end
end
