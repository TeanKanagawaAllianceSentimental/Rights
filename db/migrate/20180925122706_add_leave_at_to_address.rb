class AddLeaveAtToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :leave_at, :string
  end
end
