class CreditCard < ApplicationRecord
	belongs_to :member
  belongs_to :sale, optional: true
end
