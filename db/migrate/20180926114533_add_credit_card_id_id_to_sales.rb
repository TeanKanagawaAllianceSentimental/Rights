class AddCreditCardIdIdToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :credit_card_id, :integer
  end
end
