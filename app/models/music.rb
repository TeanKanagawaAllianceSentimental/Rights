class Music < ApplicationRecord
	belongs_to :disk, optional: true

	validates :music_title, presence: true
	validates :composer, presence: true
	validates :songwriter, presence: true

	# def self.create_with_auto_sequence(params)
	# 	music = Genre.new(params)
	#     music.set_auto_sequence
	#     music.save
	#     music
	# end

	# def set_auto_sequence
	# 	self.sequence = Music.where(music_id: music_id).maximum(:sequence).to_i + 1
 #    end
end
