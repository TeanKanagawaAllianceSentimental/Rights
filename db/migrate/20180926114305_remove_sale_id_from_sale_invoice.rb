class RemoveSaleIdFromSaleInvoice < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_invoices, :sale_id, :integer
  end
end
