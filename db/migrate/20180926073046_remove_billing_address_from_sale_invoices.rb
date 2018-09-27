class RemoveBillingAddressFromSaleInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_invoices, :billing_address, :string
  end
end
