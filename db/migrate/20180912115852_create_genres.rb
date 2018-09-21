class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
    	t.string :genre, null: false
    	t.integer :sequence, default: 0, null: false
    	t.datetime :created_at, null: false
    	t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
