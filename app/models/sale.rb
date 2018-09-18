class Sale < ApplicationRecord
	belongs_to :member_id
	has_many :sale_item_id, dependent: :destroy
end
