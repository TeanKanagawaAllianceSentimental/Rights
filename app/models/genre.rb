class Genre < ApplicationRecord
	has_many :items, dependent: :destroy
	accepts_nested_attributes_for :items

	def self.create_with_auto_sequence(params)
		genre = Genre.new(params)
	    genre.set_auto_sequence
	    geren.save
	    genre
	end

	def set_auto_sequence
		self.sequence = Genre.where(genre_id: genre_id).maximum(:sequence).to_i + 1
    end
end
