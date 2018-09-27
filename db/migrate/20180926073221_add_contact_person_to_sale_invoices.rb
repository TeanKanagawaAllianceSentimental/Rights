class AddContactPersonToSaleInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_invoices, :contact_person, :string
  end
end
