class RemoveShippingAddressIdFromSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :shipping_address_id, :integer
  end
end
