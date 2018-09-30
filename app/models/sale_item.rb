class SaleItem < ApplicationRecord
	belongs_to :sale, optional: true
  belongs_to :item
end
