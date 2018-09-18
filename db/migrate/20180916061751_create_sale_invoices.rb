class CreateSaleInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_invoices do |t|
      t.string :bill_to
      t.string :billing_postal_code
      t.string :billing_address
      t.integer :member_id
      t.integer :sale_id

      t.timestamps
    end
  end
end
