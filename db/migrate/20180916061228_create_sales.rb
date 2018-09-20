class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :total_price
      t.integer :member_id
      t.integer :delivered
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
