class AddPhoneticToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :phonetic, :string
  end
end
