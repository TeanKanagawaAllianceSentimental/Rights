class ChangeDatatypeSalesOfDeliverdAt < ActiveRecord::Migration[5.2]
  def change
    change_column :sales, :deliverd_at, :datetime
  end
end
