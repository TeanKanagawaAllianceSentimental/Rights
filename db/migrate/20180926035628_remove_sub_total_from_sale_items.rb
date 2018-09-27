class RemoveSubTotalFromSaleItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_items, :sub_total, :integer
  end
end
