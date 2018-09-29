class CreditCard < ApplicationRecord
	belongs_to :member
  has_many :sales
end
