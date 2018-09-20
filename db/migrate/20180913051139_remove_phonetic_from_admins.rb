class RemovePhoneticFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :phonetic　, :string
  end
end
