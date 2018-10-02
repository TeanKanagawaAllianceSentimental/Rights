class ChangeDatatypeGenreOfGenres < ActiveRecord::Migration[5.2]
  def change
  	change_column :genres, :genre, :integer, null: false
  end
end
