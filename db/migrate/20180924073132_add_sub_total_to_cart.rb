class AddSubTotalToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :sub_total, :integer
  end
end
