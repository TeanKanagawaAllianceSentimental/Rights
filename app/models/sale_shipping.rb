class SaleShipping < ApplicationRecord
	belongs_to :member_id, dependent: :destroy
end