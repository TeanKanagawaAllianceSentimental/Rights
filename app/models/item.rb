class Item < ApplicationRecord
	has_many :disks, dependent: :destroy
	has_many :musics, through: :disks
	belongs_to :genre, optional: true
	accepts_nested_attributes_for :disks, allow_destroy: true
	attachment :jacket_image
  has_one :cart


end
