class AddApplicationToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :Application, :integer
  end
end
