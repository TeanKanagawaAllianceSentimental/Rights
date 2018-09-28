class RemoveItemsIdFromSaleItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_items, :items_id, :integer
  end
end
