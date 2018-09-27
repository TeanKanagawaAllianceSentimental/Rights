class AddBillingAddress2ToSaleInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_invoices, :billing_address2, :string
  end
end
