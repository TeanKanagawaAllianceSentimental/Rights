class AddContactPersonToSaleShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_shippings, :contact_person, :string
  end
end
