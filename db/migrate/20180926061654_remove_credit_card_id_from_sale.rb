class RemoveCreditCardIdFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :credit_card_id, :integer
  end
end
