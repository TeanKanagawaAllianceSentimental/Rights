class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
    	t.string :disk, null: false
    	t.integer :item_id, null: false
    	t.datetime :created_at, null: false
    	t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
