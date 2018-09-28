class AddItemIdToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :item_id, :integer
  end
end
