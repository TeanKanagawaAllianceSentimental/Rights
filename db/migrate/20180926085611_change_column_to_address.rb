class ChangeColumnToAddress < ActiveRecord::Migration[5.2]
  def up
  	change_column :addresses, :corporate_name, :string, null: false
  end
  def down
  	change_column :addresses, :corporate_name, :string
  end
end
