class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :cd_title, null: false
    	t.integer :genre_id, null: false
    	t.integer :package, null: false
    	t.string :artist, null: false
    	t.text :jacket_image_id
    	t.string :label, null: false
    	t.string :unit_price
    	t.string :caption
    	t.text :about
    	t.integer :stock_quantity
    	t.string :status, null: false
    	t.datetime :created_at, null: false
    	t.datetime :updated_at, null: false
    	t.index ["genre_id"], name: "index_items_on_genre_id", using: :btree
      t.timestamps
    end
  end
end
