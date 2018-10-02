class Genre < ApplicationRecord
	has_many :items, dependent: :destroy
	has_many :disks, through: :items
	accepts_nested_attributes_for :items, allow_destroy: true

	validates :genre, presence: true

	enum genre: {JPOP: 0, Rock: 1, Soundtracks: 2, Anime: 3, Classics: 4, Jazz: 5, KPOP: 6, Rap: 7}

	def self.search(search)
		search = Genre.joins(:items).where(['cd_title LIKE ? OR artist LIKE ?', "%#{search}%", "%#{search}%"]).uniq
	end

	# def self.create_with_auto_sequence(params)
	# 	genre = Genre.new(params)
	#     genre.set_auto_sequence
	#     geren.save
	#     genre
	# end

	# def set_auto_sequence
	# 	self.sequence = Genre.where(genre_id: genre_id).maximum(:sequence).to_i + 1
 #    end
end
