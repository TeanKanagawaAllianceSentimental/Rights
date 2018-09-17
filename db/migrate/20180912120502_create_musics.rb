class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
    	t.integer :disk_id, null: false
    	t.string :music_title, null: false
    	t.string :songwriter, null: false
    	t.string :composer, null: false
    	t.integer :sequence, default: 0, null: false
    	t.datetime :created_at, null: false
    	t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
