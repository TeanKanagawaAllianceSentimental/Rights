class CreateSaleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_items do |t|
      t.integer :quantity
      t.integer :sub_total
      t.integer :sale_id
      t.integer :items_id

      t.timestamps
    end
  end
end
