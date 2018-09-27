class AddBillingAddress1ToSaleInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_invoices, :billing_address1, :string
  end
end
