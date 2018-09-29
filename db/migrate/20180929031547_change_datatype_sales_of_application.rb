class ChangeDatatypeSalesOfApplication < ActiveRecord::Migration[5.2]
  def change
    change_column :sales, :Application, :string
  end
end
