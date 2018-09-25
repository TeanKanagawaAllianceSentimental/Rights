class RemoveSubTotalFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :sub_total, :integer
  end
end
