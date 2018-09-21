class CreditCard < ApplicationRecord
	belongs_to :member_id, dependent: :destroy
end
