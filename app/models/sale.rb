class Sale < ApplicationRecord
  belongs_to :member_id
  has_many :sale_item_id, dependent: :destroy


#   def total_price
#     sale = Sale.mamber.session_id
#   end


# def total_price
#     line_items.to_a.sum { |item| item.total_price }
# end
