class SaleItem < ApplicationRecord
	belongs_to :sale, optional: true
end
