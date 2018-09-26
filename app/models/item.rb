class Item < ApplicationRecord
	has_many :disks, dependent: :destroy
	has_many :musics, through: :disks
	belongs_to :genre, optional: true
	accepts_nested_attributes_for :disks, allow_destroy: true
	attachment :jacket_image
	has_one :cart

	enum package: {single: 0, album: 1}
	enum status: {unpublished: 0, selling: 1, end_of_sell: 2}

	scope :status, -> {where(status: [:selling, :end_of_sell])}

	# def save
	# 	self.stock_quantity = 0 if self.end_of_sell?
	# 	super
	# end

	# def can_sell?
	# 	self.selling? && self.stock_quantity > 0
	# end
end
