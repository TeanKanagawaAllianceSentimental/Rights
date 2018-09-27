class AddSaleShippingIdToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :sale_shipping_id, :integer
  end
end
