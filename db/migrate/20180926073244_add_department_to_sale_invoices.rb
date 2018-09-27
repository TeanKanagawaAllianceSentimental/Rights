class AddDepartmentToSaleInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_invoices, :department, :string
  end
end
