class Item < ApplicationRecord
	has_many :disk
	has_many :music, through: :disk
	belongs_to :genre, optional: true
	attachment :jacket_image



	def save
		self.stock_quantity = 0 if self.end_of_sell?
    super
  end
end
