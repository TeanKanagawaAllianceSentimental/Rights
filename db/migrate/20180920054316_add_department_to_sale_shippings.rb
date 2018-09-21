class AddDepartmentToSaleShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_shippings, :department, :string
  end
end
