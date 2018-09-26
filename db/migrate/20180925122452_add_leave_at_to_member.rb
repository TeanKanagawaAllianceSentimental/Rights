class AddLeaveAtToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :leave_at, :string
  end
end
