class ChangeDatatypeSalesOfDelivered < ActiveRecord::Migration[5.2]
  def change
    change_column :sales, :delivered, :string
  end
end
