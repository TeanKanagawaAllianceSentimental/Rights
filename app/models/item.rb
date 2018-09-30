class Item < ApplicationRecord
	has_many :disks, dependent: :destroy
	has_many :musics, through: :disks
	belongs_to :genre, optional: true
	accepts_nested_attributes_for :disks, allow_destroy: true
	attachment :jacket_image
	has_many :carts

	enum package: {single: 0, album: 1}
	enum status: {unpublished: 0, selling: 1, end_of_sell: 2}

	validates :cd_title, presence: true
	validates :package, presence: true
	validates :artist, presence: true
	validates :label, presence: true
	validates :unit_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates :caption, presence: true
	validates :about, presence: true
	validates :stock_quantity, presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :status, presence: true

	# def save
	# 	self.stock_quantity = 0 if self.end_of_sell?
	# 	super
	# end

	# def can_sell?
	# 	self.selling? && self.stock_quantity > 0
	# end
end
