class Disk < ApplicationRecord
	has_many :musics, dependent: :destroy
	belongs_to :item, optional: true
	accepts_nested_attributes_for :musics, allow_destroy: true

	validates :disk, presence: true

	def self.create_with_auto_sequence(params)
		disk = Disk.new(params)
	    disk.set_auto_sequence
	    disk.save
	    disk
	end

	def set_auto_sequence
		self.sequence = Disk.where(disk_id: disk_id).maximum(:sequence).to_i + 1
    end
end
