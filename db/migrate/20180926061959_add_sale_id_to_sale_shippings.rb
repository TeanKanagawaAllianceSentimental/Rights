class AddSaleIdToSaleShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_shippings, :sale_id, :integer
  end
end
