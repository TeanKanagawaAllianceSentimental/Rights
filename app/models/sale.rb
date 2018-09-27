class Sale < ApplicationRecord
  belongs_to :member
  has_many :sale_items, dependent: :destroy
  belongs_to :sale_invoice, optional: true
  has_many :sale_shippings, through: :members
  accepts_nested_attributes_for :sale_shippings, allow_destroy: true
  belongs_to :credit_card, optional: true
end

