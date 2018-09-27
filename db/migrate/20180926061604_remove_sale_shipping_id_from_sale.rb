class RemoveSaleShippingIdFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :sale_shipping_id, :integer
  end
end
