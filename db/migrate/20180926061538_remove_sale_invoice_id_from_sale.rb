class RemoveSaleInvoiceIdFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :sale_invoice_id, :integer
  end
end
