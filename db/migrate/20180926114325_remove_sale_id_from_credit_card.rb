class RemoveSaleIdFromCreditCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :sale_id, :integer
  end
end
