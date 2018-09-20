class AddCorporateNameToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :corporate_name, :string
  end
end
