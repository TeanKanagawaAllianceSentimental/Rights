class AddSaleInvoiceIdToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :sale_invoice_id, :integer
  end
end
