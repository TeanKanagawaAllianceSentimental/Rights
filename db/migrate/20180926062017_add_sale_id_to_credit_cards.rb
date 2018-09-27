class AddSaleIdToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :sale_id, :integer
  end
end
