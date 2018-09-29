class AddUnitPriceToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :unit_price, :integer
  end
end
